import pandas as pd

chunk_size = 400000
batch_no = 1

for chunk in pd.read_csv('NAVHIstorynew.csv', chunksize=chunk_size):
    chunk.to_csv('NAVHIstorynew.csv' + str(batch_no) + '.csv', index=False)
    batch_no +=1
