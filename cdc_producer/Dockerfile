FROM python:3.9-slim

WORKDIR /app

RUN pip install cassandra-driver kafka-python

COPY producer.py .

CMD ["python", "-u", "producer.py"]