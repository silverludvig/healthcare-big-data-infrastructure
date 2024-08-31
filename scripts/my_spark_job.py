from pyspark.sql import SparkSession
from pyspark.sql.functions import col, mean

def main(input_path, output_path):
    # Initialize a Spark session
    spark = SparkSession.builder \
        .appName("Healthcare Cost Analysis") \
        .getOrCreate()

    # Load the input data
    df = spark.read.csv(input_path, header=True, inferSchema=True)

    # Clean data by dropping rows with missing billing amounts
    df_cleaned = df.dropna(subset=['Billing Amount'])

    # Aggregate data to calculate average billing amount by medical condition
    cost_analysis = df_cleaned.groupBy("Medical Condition").agg(
        mean("Billing Amount").alias("Avg Billing Amount")
    )

    # Save the analysis to the output path
    cost_analysis.write.csv(output_path, header=True, mode="overwrite")

    # Stop the Spark session
    spark.stop()

if __name__ == "__main__":
    input_path = "/tmp/extracted_data.csv"
    output_path = "/tmp/cost_analysis.csv"
    main(input_path, output_path)
