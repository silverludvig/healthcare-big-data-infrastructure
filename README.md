# AWS-Driven Big Data Infrastructure for Healthcare using Terraform, Jenkins, and Ansible.

The goal of this project is to build and manage a scalable infrastructure for assessing healthcare costs using Amazon Web Services. Amazon RDS offers secure and easily accessible data storage, AWS EMR with Apache Spark manages data processing tasks, and Terraform automates AWS infrastructure deployment and configuration. Ansible is used for monitoring and logging, while Jenkins is utilized for supporting continuous integration and deployment (CI/CD) pipelines. This research analyzes healthcare cost using patient demographics, medical conditions, and treatment records, delivering significant insights. Although some tools, such as Ansible and Jenkins, may be unnecessary for a personal project, they are included to help with learning and skill development in these areas.

# Technologies Used:
Amazon RDS: A relational database that stores structured healthcare data.
Amazon EMR (Elastic MapReduce) is used in conjunction with Apache Spark to process and analyze large datasets.
Terraform automates the provisioning and configuration of AWS services.
Python is used for scripting and automating data workflows, focusing on data extraction, processing, and analysis.
Ansible: automating monitoring and logging configurations across the infrastructure.
Data Governance: ensure the proper management, quality, and security of healthcare data.

# Project structure:
/scripts: Python scripts

/ansible: Ansible playbooks and roles for configuring monitoring and logging across the infrastructure, ensuring that all operations are recorded and anomalies are detected early on.

/jenkins contains Jenkins pipeline configurations and scripts for automating infrastructure updates and managing data workflows.

/terraform: Contains the Terraform scripts used to provision and configure the AWS infrastructure, such as Amazon RDS, EMR clusters, IAM roles, security groups, and other logging and monitoring tools. 

# Security and Governance:
The infrastructure is built with security and governance in mind, especially for sensitive healthcare data. The key features include:
Encryption: Amazon RDS is configured with encryption at rest and in transit to ensure that data is always secure.
Access Control: IAM roles and security groups are set.
Monitoring and Logging: Automated via Ansible, which uses AWS CloudWatch to track access, usage, and performance across the infrastructure.
Data Governance: Governance methods are used to ensure the quality and integrity of healthcare data. This includes establishing data access procedures, and carrying out data quality checks.

# Additional Details:
Ansible for Monitoring and Logging: Ansible playbooks are used to configure AWS CloudWatch, create alarms, and handle log aggregation. This ensures that any infrastructure issues are noticed and resolved as soon as possible.
Jenkins for CI/CD: Jenkins CI/CD pipelines are set up to automate the deployment of Terraform scripts, Python data workflows, and Ansible playbooks. This helps to maintain uniformity between environments while also reducing the need for manual intervention.
Data Governance: Even though the data utilized in this project is from a Kaggle dummy dataset, data governance principles are followed as if it were genuine healthcare data.
