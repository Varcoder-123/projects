# 📖 Project Documentation

## 🚀 Step 1: Infrastructure Provisioning using Terraform

The project began with provisioning the Azure infrastructure using Terraform. To maintain a structured approach, the Terraform files were created and configured in the following order:

1. `provider.tf`
2. `network.tf`
3. `nsg.tf`
4. `nic.tf`
5. `public-ip.tf`
6. `vm.tf`
7. `mysql.tf`
8. `.gitignore`
9. `variables.tf`

This phase helped in understanding the complete infrastructure setup, networking components, and resource dependencies within Azure.

---

## ☕ Step 2: Application Analysis and Configuration

After the infrastructure was ready, I moved on to the application layer by reviewing the **Java-Login-App** source code.

Initially, the application was cloned without any modifications. During the build process, I identified dependency-related issues and updated the `pom.xml` file, specifically focusing on:

- `mysql-connector-java`
- `tomcat-jasper`

These modifications ensured successful database connectivity and application packaging.

---

## ⚙️ Step 3: CI/CD Pipeline Implementation

Once the application was building successfully, I integrated Jenkins by creating a dedicated **Jenkinsfile**.

This enabled automation of the application's build and deployment workflow, forming the foundation of the CI/CD pipeline.

---

## 🗄️ Step 4: Database Configuration

The final application configuration involved updating the database connection parameters in the `application.properties` file.

The datasource URL, username, and password were configured according to the Azure MySQL database instance created during the infrastructure provisioning phase.

---

## 🔍 Step 5: Code Quality Analysis with SonarQube

Configured SonarQube as part of the Jenkins CI/CD pipeline to perform automated static code analysis. The first scan reported **13 issues**, including code smells and potential bugs. I analyzed each finding, implemented the recommended fixes, and successfully improved the project's maintainability and code quality.

---

# 🚧 Challenges Faced & Key Learnings

### 📌 Understanding the Project Workflow

One of the initial challenges was understanding the overall project structure, identifying where to begin, and learning how each phase of the project connects together—from infrastructure provisioning to application deployment.

---

### 🌐 Azure Networking Concepts

Gained a deeper understanding of Azure networking components, including:

- Virtual Networks (VNet)
- Subnets
- Network Security Groups (NSG)
- Network Interfaces (NIC)

Additionally, I learned how NSGs can be associated either at the **Subnet level** or the **NIC level** depending on the security requirements.

---

### 🗄️ Azure MySQL Region Constraints

While creating the Azure MySQL Database, I encountered deployment limitations related to the selected region.

To resolve this issue, the deployment region was changed to **Japan East**, after which the database was provisioned successfully.

---

### 🔐 VM Authentication Approach

The virtual machine was initially configured using **SSH Key Authentication**. During troubleshooting and connectivity testing, I switched to **Password Authentication** to simplify access and administration.

This provided practical exposure to both authentication methods and their respective use cases.

---

### 🛡️ Securing Sensitive Information

A key consideration during development was preventing sensitive information from being exposed in the repository.

To address this, I utilized the `.gitignore` file to exclude sensitive files and credentials from version control, improving overall repository security.

---

### 🔧 Maven Dependency Troubleshooting

While building the application, issues were encountered with the following dependencies:

- `mysql-connector-java`
- `tomcat-jasper`

After analyzing the dependency configuration, the required modifications were made within the `pom.xml` file, resulting in a successful build and deployment process.

---

### 🐳 Docker Base Image Deprecation

During the Docker image creation process, I discovered that the `openjdk:17` image had been deprecated. To ensure long-term compatibility and security updates, I migrated the application to use the `eclipse-temurin:17-jre` image.

---

### ❌ Application Not Accessible After Container Deployment

After successfully creating and deploying the container, the application webpage was not accessible even after configuring the required NSG rules.

Upon investigating the container logs, I identified a Tomcat dependency version mismatch (commonly known as **JAR Hell**) within the application.

To resolve the issue, I:

- Updated the `tomcat-jasper` dependency version.
- Removed the `<scope>provided</scope>` configuration from the dependency.
- Rebuilt and redeployed the application container.
  
---

### 🌿 Git Rollback and Recovery

While troubleshooting deployment issues, I leveraged Git version control to perform rollbacks and restore previously working configurations.

This helped me compare changes, isolate problematic updates, and recover quickly without impacting the overall project progress.

---

### 🛡️ Spring Security Authentication Issues

After deployment, I was unable to log in to the application because the credentials were not clearly documented.

After investigation, I discovered that the login page was generated by Spring Security's default authentication mechanism and was using the default credentials configured within the application.

Even after successful authentication, the application redirected users to an unexpected page due to Spring Security's default configuration.

To continue with the project implementation, I temporarily disabled Spring Security by removing the following dependency from the `pom.xml` file:

<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>



<img width="619" height="409" alt="image" src="https://github.com/user-attachments/assets/5f155fcb-c26c-405d-adec-06294dcb442d" />

---


