FROM apache/spark:3.4.0

USER root

WORKDIR /app

# CÀI ĐẶT WGET
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# TẢI CÁC THƯ VIỆN VÀO /opt/spark/jars/
RUN wget -q https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.12/3.4.0/spark-sql-kafka-0-10_2.12-3.4.0.jar -P /opt/spark/jars/
RUN wget -q https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar -P /opt/spark/jars/
RUN wget -q https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/3.3.2/kafka-clients-3.3.2.jar -P /opt/spark/jars/
RUN wget -q https://repo1.maven.org/maven2/org/apache/spark/spark-token-provider-kafka-0-10_2.12/3.4.0/spark-token-provider-kafka-0-10_2.12-3.4.0.jar -P /opt/spark/jars/
RUN wget -q https://repo1.maven.org/maven2/org/apache/commons/commons-pool2/2.11.1/commons-pool2-2.11.1.jar -P /opt/spark/jars/
RUN wget -q https://repo1.maven.org/maven2/commons-logging/commons-logging/1.2/commons-logging-1.2.jar -P /opt/spark/jars/

COPY ETL_script.py /app/ETL_script.py

USER 185

CMD ["/opt/spark/bin/spark-submit", \
     "--master", "local[*]", \
     "/app/ETL_script.py"]