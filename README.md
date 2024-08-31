# AWS-Driven Big Data Infrastructure for Healthcare Using Terraform, Jenkins, and Ansible

This project aims to create and manage a scalable infrastructure for processing structured healthcare data with AWS services. Amazon RDS provides safe and highly accessible data storage, AWS EMR with Apache Spark handles complicated data processing, and Terraform automates AWS infrastructure deployment and configuration. Ansible is also utilized for monitoring and logging, data governance principles are established, and Jenkins is integrated to support continuous integration and deployment (CI/CD) pipelines. While some of these tools, like as Ansible, Jenkins, and data governance, may not be required for a personal project, they are included to help with learning and skill development in those areas.


# Technologies Used: 
Amazon RDS: A relational database that stores structured healthcare data. Amazon EMR (Elastic MapReduce) is used in conjunction with Apache Spark to process enormous amounts of data. Terraform is an infrastructure as code solution that automates the provisioning and setup of Amazon Web Services services. Python is used to script and automate data operations between RDS and EMR. Ansible: A tool for automating monitoring and logging configurations across an infrastructure. Jenkins: Used in CI/CD to automate the deployment of infrastructure updates and data workflows. Data Governance refers to the practices used to assure the correct management, quality, and security of healthcare data. Updated Project Structure/terraform: Contains the Terraform scripts required to provision the AWS infrastructure, such as RDS, EMR clusters, IAM roles, security groups, and other logging and monitoring tools.


# Project Structure:
/scripts: Python scripts used to automate data workflows like extraction, processing, and loading.

/ansible: Ansible playbooks and roles for configuring monitoring and logging across the infrastructure, ensuring that all operations are logged and anomalies are identified early on.

/jenkins: Jenkins pipeline configurations and scripts for automating infrastructure updates and managing data workflows.

/data_governance: Documentation and scripts for data governance processes, such as data quality checks, metadata management, and access control policies.



# Security and Governance:
The infrastructure is built with security and governance in mind, especially for sensitive healthcare data. The key features include:

Encryption: Amazon RDS is set with encryption at rest and in transit to ensure that data is always secure.
Access Control: IAM roles and security groups are carefully set to guarantee that only authorised persons and services may access the data.
Monitoring and logging are automated via Ansible, which uses AWS CloudWatch and other tools to track access, usage, and performance across the infrastructure.
Data Governance: Governance methods are used to ensure the quality and integrity of healthcare data. This includes establishing data access procedures, carrying out data quality checks, and verifying compliance with applicable data protection requirements.

# Additional Details:
Ansible for Monitoring and Logging: Ansible playbooks are used to configure AWS CloudWatch, create alarms, and handle log aggregation. This ensures that any infrastructure issues are noticed and resolved as soon as possible.
Jenkins CI/CD pipelines are set up to automate the deployment of Terraform scripts, Python data workflows, and Ansible playbooks. This helps to maintain uniformity between situations while also reducing the need for manual intervention.
Data Governance: Even though the data utilized in this project is from a Kaggle dummy dataset, data governance principles are followed as if it were genuine healthcare data.

