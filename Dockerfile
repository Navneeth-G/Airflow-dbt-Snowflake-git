FROM apache/airflow:2.10.5

USER root
RUN apt-get update && apt-get install -y git
USER airflow