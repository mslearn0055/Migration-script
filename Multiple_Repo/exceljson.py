import pandas as pd
import json
import sys

def fileconvertion(filename):
    df = pd.read_excel(filename, sheet_name='Sheet1')
    json_data = df.to_json(orient='records')
    json_data_pretty = json.dumps(json.loads(json_data), indent=4)
    
    with open('migration.json', 'w') as f:
        f.write(json_data_pretty)

fileconvertion(sys.argv[1])
