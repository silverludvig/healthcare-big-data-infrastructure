import boto3
import pymysql  # or use psycopg2 for PostgreSQL
import time
import logging
from botocore.exceptions import ClientError

# Initialize AWS clients
rds_client = boto3.client('rds', region_name='eu-north-1')
emr_client = boto3.client('emr', region_name='eu-north-1')

# Define parameters
RDS_DB_IDENTIFIER = 'healthcare_db'
EMR_CLUSTER_ID = 'j-3H4K5L6P7J8M9N0P1' 
DB_USERNAME = 'admin_user'
DB_PASSWORD = 'Str0ngP@ssw0rd!'
DB_NAME = 'healthcare'

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def extract_data_from_rds(query, output_path):
    try:
        logging.info("Connecting to RDS and extracting data...")
        rds_instance = rds_client.describe_db_instances(DBInstanceIdentifier=RDS_DB_IDENTIFIER)
        rds_endpoint = rds_instance['DBInstances'][0]['Endpoint']['Address']
        
        # Connect to the RDS MySQL instance
        conn = pymysql.connect(host=rds_endpoint,
                               user=DB_USERNAME,
                               password=DB_PASSWORD,
                               database=DB_NAME)
        
        with conn.cursor() as cursor:
            cursor.execute(query)
            result = cursor.fetchall()
            with open(output_path, 'w') as output_file:
                for row in result:
                    output_file.write(','.join(map(str, row)) + '\n')
        
        conn.close()
        logging.info(f"Data extraction complete. Data saved to {output_path}")
    except ClientError as e:
        logging.error(f"Failed to extract data from RDS: {e}")
        raise
    except pymysql.MySQLError as e:
        logging.error(f"MySQL error occurred: {e}")
        raise

def submit_spark_job(script_path, input_path, output_path):
    try:
        logging.info(f"Submitting Spark job to EMR cluster {EMR_CLUSTER_ID}...")
        response = emr_client.add_job_flow_steps(
            JobFlowId=EMR_CLUSTER_ID,
            Steps=[
                {
                    'Name': 'Spark application',
                    'ActionOnFailure': 'CONTINUE',
                    'HadoopJarStep': {
                        'Jar': 'command-runner.jar',
                        'Args': [
                            'spark-submit',
                            '--deploy-mode', 'cluster',
                            script_path,
                            input_path,
                            output_path
                        ]
                    }
                }
            ]
        )
        step_id = response['StepIds'][0]
        logging.info(f"Spark job submitted with step ID: {step_id}")
        
        # Polling EMR to track the step status
        status = 'PENDING'
        while status in ['PENDING', 'RUNNING']:
            response = emr_client.describe_step(ClusterId=EMR_CLUSTER_ID, StepId=step_id)
            status = response['Step']['Status']['State']
            logging.info(f"Current step status: {status}")
            if status in ['COMPLETED', 'FAILED']:
                break
            time.sleep(30)
        
        if status == 'COMPLETED':
            logging.info("Spark job completed successfully.")
        else:
            logging.error("Spark job failed.")
            raise Exception("Spark job failed.")
    except ClientError as e:
        logging.error(f"Failed to submit or monitor Spark job: {e}")
        raise

def load_data_into_rds(input_path):
    try:
        logging.info("Loading processed data back into RDS...")
        rds_instance = rds_client.describe_db_instances(DBInstanceIdentifier=RDS_DB_IDENTIFIER)
        rds_endpoint = rds_instance['DBInstances'][0]['Endpoint']['Address']
        
        # Connect to the RDS MySQL instance
        conn = pymysql.connect(host=rds_endpoint,
                               user=DB_USERNAME,
                               password=DB_PASSWORD,
                               database=DB_NAME)
        
        with conn.cursor() as cursor:
            with open(input_path, 'r') as input_file:
                for line in input_file:
                    # Assuming CSV format
                    data = line.strip().split(',')
                    cursor.execute("INSERT INTO processed_table (column1, column2, ...) VALUES (%s, %s, ...)", data)
        
        conn.commit()
        conn.close()
        logging.info(f"Data loaded successfully from {input_path} into RDS.")
    except ClientError as e:
        logging.error(f"Failed to load data into RDS: {e}")
        raise
    except pymysql.MySQLError as e:
        logging.error(f"MySQL error occurred: {e}")
        raise

def main():
    try:
        logging.info("Starting data workflow...")
        query = "SELECT id, name, diagnosis, treatment_date FROM patients WHERE treatment_date > '2023-01-01';"

        output_path = "/tmp/extracted_data.csv"
        
        extract_data_from_rds(query, output_path)
        
        spark_script_path = "/home/hadoop/my_spark_job.py" 
        processed_output_path = "/tmp/processed_data.csv"
        
        submit_spark_job(spark_script_path, output_path, processed_output_path)
        
        load_data_into_rds(processed_output_path)
        
        logging.info("Data workflow completed successfully.")
    except Exception as e:
        logging.error(f"Workflow failed: {e}")

if __name__ == "__main__":
    main()
