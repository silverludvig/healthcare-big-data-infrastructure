# AWS-Driven Big Data Infrastructure for Healthcare with Terraform, Jenkins, and Ansible

This project focuses on building and managing a scalable infrastructure for processing structured healthcare data using AWS services. The core components include Amazon RDS for secure and highly available data storage, AWS EMR with Apache Spark for complex data processing, and Terraform for automating the provisioning and configuration of AWS infrastructure. Additionally, Ansible is used for monitoring and logging, data governance practices are implemented, and Jenkins is added for continuous integration and deployment (CI/CD) pipelines. While some of these tools, like Ansible, Jenkins, and data governance, might not be essential for a personal project, they are included to facilitate learning and skill development in these areas.

Technologies Used
Amazon RDS: Relational database for storing structured healthcare data.
Amazon EMR (Elastic MapReduce): Used with Apache Spark for large-scale data processing.
Terraform: Infrastructure as code tool used for automating the provisioning and configuration of AWS resources.
Python: Used for scripting and automating data workflows between RDS and EMR.
Ansible: Used for automating the monitoring and logging setup across the infrastructure.
Jenkins: Implemented for CI/CD to automate the deployment of infrastructure changes and data workflows.
Data Governance: Practices implemented to ensure the proper management, quality, and security of healthcare data.
Updated Project Structure
/terraform: Contains the Terraform scripts used to provision the AWS infrastructure, including RDS, EMR clusters, IAM roles, security groups, and additional resources for logging and monitoring.

/scripts: Python scripts that automate data workflows, such as data extraction, processing, and loading tasks.

/ansible: Ansible playbooks and roles for setting up monitoring and logging across the infrastructure, ensuring that all activities are tracked and anomalies are detected early.

/jenkins: Jenkins pipeline configurations and scripts to automate the deployment of infrastructure changes and manage data workflows.

/data_governance: Documentation and scripts related to data governance practices, including data quality checks, metadata management, and access control policies.

Security and Governance
The infrastructure is designed with security and governance in mind, particularly for handling sensitive healthcare data. Key features include:

Encryption: Amazon RDS is configured with encryption at rest and in transit, ensuring that data is always protected.

Access Control: IAM roles and security groups are carefully configured to ensure that only authorized personnel and services have access to the data.

Monitoring and Logging: Ansible is used to automate the setup of monitoring and logging, utilizing AWS CloudWatch and other tools to track access, usage, and performance across the infrastructure.

Data Governance: Governance practices are implemented to maintain the quality and integrity of healthcare data. This includes setting up policies for data access, implementing data quality checks, and ensuring compliance with relevant data protection regulations.

Additional Details
Ansible for Monitoring and Logging: Ansible playbooks are used to configure AWS CloudWatch, set up alerts, and manage log aggregation. This ensures that any issues within the infrastructure are detected and addressed promptly.

Jenkins for CI/CD: Jenkins pipelines are configured to automate the deployment of Terraform scripts, Python data workflows, and Ansible playbooks. This helps in maintaining consistency across environments and reduces manual intervention.

Data Governance: Although the data used in this project is from a Kaggle dummy dataset, data governance practices are applied as if it were real healthcare data. This includes establishing data stewardship roles, creating data quality dashboards, and implementing data retention policies.

