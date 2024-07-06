#import sys
#import pandas as pd
#import xlrd

def fileconvertion(filepath):
    try:
        # Read the Excel file
        excel_data = pd.read_excel(filepath)
        # Convert Excel to JSON
        json_data = excel_data.to_json(orient='records')
        # Save JSON data to a file
        json_filename = filepath.replace('.xlsx', '.json')
        with open(json_filename, 'w') as json_file:
            json_file.write(json_data)
        print(f"Conversion successful: {json_filename}")
    except Exception as e:
        print(f"Error during conversion: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python exceljson.py <path_to_excel_file>")
        sys.exit(1)
    
    fileconvertion(sys.argv[1])
