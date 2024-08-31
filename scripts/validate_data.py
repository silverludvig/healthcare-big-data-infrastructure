import pandas as pd

def validate_data(file_path):
    try:
        # Load the data into a pandas DataFrame
        df = pd.read_csv(file_path)
        
        # Check for null values in critical columns
        if df['Billing Amount'].isnull().any():
            raise ValueError("Data contains null values in 'Billing Amount'.")

        # Ensure 'Billing Amount' is a numeric type
        if not pd.api.types.is_numeric_dtype(df['Billing Amount']):
            raise ValueError("Column 'Billing Amount' should be numeric.")

        # Ensure 'Medical Condition' is present
        if df['Medical Condition'].isnull().any():
            raise ValueError("Missing values in 'Medical Condition' column.")

        print("Data validation passed.")
    except Exception as e:
        print(f"Data validation failed: {e}")
        raise

if __name__ == "__main__":
    validate_data("/tmp/cost_analysis.csv")
