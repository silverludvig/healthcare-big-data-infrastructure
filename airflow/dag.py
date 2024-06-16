from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta


# change as needed to satisfy your need like change the start date or email_on_failure
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 3, 1),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG(
    'hadoop_data_pipeline',
    default_args=default_args,
    description='A simple data pipeline for Hadoop',
    schedule_interval=timedelta(days=1),
)

t1 = BashOperator(
    task_id='start_hadoop_job',
    bash_command='hadoop jar my_hadoop_job.jar',
    dag=dag,
)

t2 = BashOperator(
    task_id='upload_to_s3',
    bash_command='aws s3 cp /path/to/data s3://healthcare-patient-data/',
    dag=dag,
)

t1 >> t2
