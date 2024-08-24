# AWS-Driven Big Data Infrastructure for Healthcare


This project focuses on building and managing a scalable infrastructure for processing structured healthcare data using AWS services. Amazon RDS is the relational database, responsible for securely storing and managing healthcare data with high availability and compliance with regulations. For complex data processing and analytics, AWS EMR with Apache Spark is used to efficiently handle large datasets. Terraform is leveraged to automate the provisioning and configuration of AWS infrastructure, ensuring that everything is consistent and easily repeatable. Python scripts are to automate the data workflows, such as extracting data from RDS, processing it in Spark on EMR, and then loading the processed data back into RDS.


## Technologies Used

- **Amazon RDS**: Relational database for storing structured healthcare data.
- **Amazon EMR (Elastic MapReduce)**: Used with Apache Spark for large-scale data processing and analytics.
- **Apache Spark**: For big data analytics.
- **Terraform**: Infrastructure as code tool used for automating the provisioning and configuration of AWS resources.
- **Python**: Used for scripting and automating data workflows between RDS and EMR.

## Project Structure

- **/terraform**: Contains the Terraform scripts used to provision the AWS infrastructure, including RDS, EMR clusters, and necessary IAM roles and security groups.
- **/scripts**: Python scripts that automate data workflows, such as data extraction, processing, and loading tasks.
  
## Security and Compliance

The infrastructure is designed with security and compliance in mind, particularly for handling sensitive healthcare data. Amazon RDS is configured with encryption at rest and in transit, and IAM roles are used to ensure proper access control. Logging and monitoring are enabled to track access and usage across the infrastructure.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
