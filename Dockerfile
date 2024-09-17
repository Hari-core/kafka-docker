# Use a base image
FROM openjdk:11-jre-slim

# Set environment variables for Kafka and Zookeeper versions
ENV KAFKA_VERSION=2.8.0
ENV SCALA_VERSION=2.13
ENV KAFKA_HOME=/opt/kafka

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y netcat && \
    rm -rf /var/lib/apt/lists/*

# Download Kafka binaries
RUN wget https://archive.apache.org/dist/kafka/2.8.0/kafka_2.13-2.8.0.tgz -O /tmp/kafka.tgz && \

    mkdir -p $KAFKA_HOME && \
    tar -xvzf /tmp/kafka.tgz --strip 1 -C $KAFKA_HOME && \
    rm /tmp/kafka.tgz

# Set the working directory
WORKDIR $KAFKA_HOME

# Copy Kafka configuration (optional if you're adding custom configs)
COPY config/server.properties $KAFKA_HOME/config/server.properties


# Expose the necessary ports
EXPOSE 9092 2181

# Start Zookeeper and Kafka in one command (or use supervisord for better control)
CMD ["sh", "-c", "$KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties & $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties"]
