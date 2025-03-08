# Custom Airflow Docker Setup with dbt and Snowflake Support

This repository contains a modified version of the official Apache Airflow Docker Compose setup with additional configurations to support **dbt** and **Snowflake** integration.

---

## 📌 Original Source

The base `docker-compose.yaml` file was obtained using the official Airflow command:

```sh
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.10.5/docker-compose.yaml'
```

---

## 🔧 Modifications from the Original Setup

### 1️⃣ Custom Docker Image  
- Changed from using the official Airflow image to building a **custom image** with Git installed.  
- **Original:**
  ```yaml
  image: ${AIRFLOW_IMAGE_NAME:-apache/airflow:2.10.5}
  ```
- **Modified:**
  ```yaml
  build: .
  ```
  (This uses a `Dockerfile` to build a custom image.)

### 2️⃣ Added a Custom `Dockerfile`  
- A new `Dockerfile` was created to install **Git**, which is required by **dbt**.

### 3️⃣ Volume Mounts  
- Mounted the **dbt project directory** inside the Airflow container:
  ```yaml
  volumes:
    - ${AIRFLOW_PROJ_DIR:-.}/dbt:/opt/airflow/dbt
  ```

### 4️⃣ Additional Python Packages  
- Added **dbt** and **Snowflake** support by modifying the `requirements.txt` or installing via `pip`:
  ```txt
  dbt-snowflake==1.9.2
  dbt-core==1.9.3
  cryptography==41.0.7
  ```

---

## 🚀 Setup Instructions

1️⃣ **Create a `.env` file** with your credentials.  
2️⃣ **Place your dbt project(s)** in the `dbt` directory.  
3️⃣ **Run the setup** using Docker Compose:  
   ```sh
   docker-compose up -d
   ```

---

## 📌 Notes

- This setup is based on the **official Apache Airflow Docker Compose file** but has been modified to support **dbt** workflows with **Snowflake** integration.
- The custom **Dockerfile** ensures that **Git** is installed inside the Airflow container, enabling seamless interaction with dbt repositories.
