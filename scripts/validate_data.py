import pandas as pd

def validate_data(file_path):
    try:
        # Load the data into a pandas DataFrame
        df = pd.read_csv(file_path)
        
        # Check for null values
        if df.isnull().values.any():
            raise ValueError("Data contains null values.")

        # Ensure specific columns are of the correct type
        if not pd.api.types.is_numeric_dtype(df['id']):
            raise ValueError("Column 'id' should be numeric.")

        print("Data validation passed.")
    except Exception as e:
        print(f"Data validation failed: {e}")
        raise

if __name__ == "__main__":
    validate_data("/tmp/processed_data.csv")
