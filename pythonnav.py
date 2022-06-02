import pandas as pd
import snowflake.connector
data = pd.read_csv(r'C:\Users\shwetht\Desktop\bigNavHistory.csv')
df = pd.DataFrame(data, columns= ['code','nav_date','nav','repurchase_price','sale_price'])
print(df)

#gets version
conn = snowflake.connector.connect(
   user = 'Shwethat',
   password = 'Sunrise.123',
   account = 'kj76050.ap-south-1'
   )

#create cursor
cur = conn.cursor()

#Execute query
cur.execute("use warehouse transform_wh;")
cur.execute("use mainassignment")

#insert data to table
for row in df.itertuples():
    cur.execute('''SQLCommand = "insert into navhistory values(code,nav_date,nav,repurchase_price,sale_price) values(?,?,?,?,?)''',row.code,row.nav_date,row.nav,row.repurchase_price,row.sale_price)
conn.commit()    


#fetch result
SQLShow = "select * from navhistory"
cur.execute(SQLShow)
conn.commit()
for record in cur:
    print(record)

   
