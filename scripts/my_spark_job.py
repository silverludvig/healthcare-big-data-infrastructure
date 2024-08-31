from pyspark.sql import SparkSession
from pyspark.sql.functions import col, when

def main(input_path, output_path):
    # Initialize a Spark session
    spark = SparkSession.builder \
        .appName("Healthcare Data Processing") \
        .getOrCreate()

    # Load the input data
    df = spark.read.csv(input_path, header=True, inferSchema=True)

    # Clean data by filling null values and filtering
    df_cleaned = df.fillna({'diagnosis': 'unknown'}) \
                   .filter(col('treatment_date') > '2023-01-01')

    #  Add a derived column based on a condition
    df_transformed = df_cleaned.withColumn(
        "treatment_status",
        when(col("treatment_date") > '2024-01-01', "recent").otherwise("old")
    )

    # Save the transformed data to the output path
    df_transformed.write.csv(output_path, header=True, mode="overwrite")

    # Stop the Spark session
    spark.stop()

if __name__ == "__main__":
    input_path = "/tmp/extracted_data.csv"
    output_path = "/tmp/processed_data.csv"
    main(input_path, output_path)
