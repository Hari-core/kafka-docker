# Kafka Docker

This project provides a Dockerized setup for running Apache Kafka and Zookeeper, aimed at simplifying the deployment process for development and testing environments.

## Features

- **Current Features**:
  - Apache Kafka (2.8.0) for event streaming.
  - Zookeeper (7.2.1) for distributed synchronization and configuration management.
  - Easy setup using Docker Compose for both services.
  - Default configurations for quick use in local environments.

- **Upcoming Features**:
  - **Kafka UI Dashboard**: A web-based Kafka monitoring tool.
  - **SSL/TLS Configuration**: Secure communication between Kafka and clients.
  - **Multi-broker Setup**: Support for running multiple Kafka brokers in a single Docker Compose file.
  - **Automatic Topic Creation**: Scripts for automatic creation and management of Kafka topics.

## Problem Faced

While setting up Kafka and Zookeeper using Docker, I encountered issues with Zookeeper's connectivity, as Kafka depends on it to start. The challenge was ensuring Zookeeper was fully initialized before Kafka started.

### Troubleshooting the Issues

1. **Zookeeper Start Delay**: I noticed Kafka would fail to connect to Zookeeper if Zookeeper took too long to initialize. I solved this by adding a delay between the Zookeeper and Kafka startup in the `Dockerfile` using a combination of the `&` operator and a short sleep command to allow time for Zookeeper to be ready.
   
2. **Port Conflicts**: There were issues with port conflicts on the system due to other services using the same ports (2181 for Zookeeper and 9092 for Kafka). To resolve this, I updated the `docker-compose.yml` file to expose the services on different local ports.

3. **Unstable Networking**: Sometimes the networking between Kafka and Zookeeper would fail. To resolve this, I ensured both services were part of the same Docker network, allowing them to communicate seamlessly.

## Tech Stack

- **Apache Kafka**: For distributed event streaming.
- **Apache Zookeeper**: For managing configuration and synchronization.
- **Docker & Docker Compose**: For containerized service orchestration.
- **OpenJDK 11**: As the base runtime environment for Kafka.

### Why This Tech Stack?

- **Apache Kafka** is a widely adopted tool for building real-time streaming applications. Its versatility, scalability, and high throughput make it perfect for event-driven architectures.
- **Apache Zookeeper** is crucial for managing Kafka brokers and coordinating their interactions. Zookeeper ensures the high availability and stability of the distributed Kafka cluster.
- **Docker and Docker Compose** simplify the deployment process, making it easy to run Kafka and Zookeeper with minimal configuration. Docker provides an isolated environment, reducing the setup complexity on local machines.

## Future Features

- **Monitoring Tools**: Integrate Kafka monitoring tools like Confluent Control Center or Kafdrop for easy visualization of Kafka clusters.
- **Scalability Enhancements**: Add support for running multiple Kafka brokers and improving load distribution.
- **Automated Health Checks**: Implement automated health checks for both Kafka and Zookeeper services to ensure high availability.
- **Cloud Deployment**: Offer configuration for deploying the setup on cloud platforms like AWS, Azure, or GCP.

## Conclusion

This project provides a foundational setup for using Kafka and Zookeeper in a Dockerized environment. As I continue to work on it, the project will evolve with new features that enhance scalability, security, and monitoring capabilities, making it more suitable for production-grade setups.


