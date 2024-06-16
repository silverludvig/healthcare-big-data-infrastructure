# Healthcare Big Data Infrastructure with Automated Reporting

This project sets up and manages a comprehensive Hadoop ecosystem on Kubernetes, automating deployment and configuration using Ansible and Terraform. It includes security measures, data management, and workflow orchestration tailored for healthcare data.

## Table of Contents

- [Overview](#overview)
- [Components](#components)
- [Setup](#setup)
- [Security](#security)
- [Data Processing](#data-processing)
- [Workflow Orchestration](#workflow-orchestration)
- [Compliance](#compliance)
- [Contributing](#contributing)
- [License](#license)

## Overview

The project encompasses the following key components:

- **Hadoop Ecosystem**: HDFS, Yarn, Hive, Spark
- **Container Orchestration**: Kubernetes
- **Automation**: Ansible, Terraform
- **Data Management**: MongoDB, AWS S3
- **Workflow Orchestration**: Apache Airflow


## Components

### Hadoop Ecosystem

- **HDFS**: Distributed file system for storing large data sets.
- **Yarn**: Resource management for Hadoop.
- **Hive**: Data warehouse software for querying and managing large datasets.
- **Spark**: Fast and general-purpose cluster-computing system.

### Container Orchestration

- **Kubernetes**: Automates deployment, scaling, and operations of application containers.

### Automation

- **Ansible**: Automates software provisioning, configuration management, and application deployment.
- **Terraform**: Provides infrastructure as code.

### Security

Implementing basic security measures to ensure the protection of sensitive healthcare data:

1. **Data Encryption**:
    - Use encryption at rest for data stored in HDFS, MongoDB, and AWS S3.
    - Use encryption in transit (TLS) for data transferred between services.

2. **Access Control**:
    - Implement role-based access control (RBAC) in Kubernetes to limit access to cluster resources.
    - Use IAM roles and policies to control access to AWS resources.

3. **Monitoring and Auditing**:
    - Enable logging and monitoring using tools like AWS CloudWatch.
    - Regularly review audit logs for any unauthorized access or suspicious activities.

### Data Management

- **MongoDB**: NoSQL database for managing unstructured patient data.
- **AWS S3**: Scalable object storage for data.
### Data Processing

Data is processed and stored using:
Hadoop Ecosystem: HDFS, Yarn, Hive, Spark.
MongoDB: For unstructured patient data.
AWS S3: For large-scale data storage.

### Workflow Orchestration

- **Apache Airflow**: Orchestrates complex computational workflows.
### Compliance
Ensures compliance with healthcare data regulations such as HIPAA.



### Prerequisites

- Docker
- Kubernetes
- Ansible
- Terraform
- AWS CLI

### Contributing
Contributions are welcome! Please submit a pull request or open an issue for any improvements or bugs.
