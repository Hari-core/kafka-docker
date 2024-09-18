# Kafka Docker
This project sets up Apache Kafka and Zookeeper using Docker.

## Setup

### Prerequisites

- Docker
- Docker Compose

### Build the Kafka Docker Image

Navigate to the directory containing your `Dockerfile` and build the image:
docker
```bash
build -t custom-kafka 
```
## Start the Services
Use Docker Compose to start Zookeeper and Kafka:
```bash 
docker-compose up 
```
## Configuration
Zookeeper: Accessible on port 2181.
Kafka: Accessible on port 9092.
### Stopping the Services
To stop and remove the containers, use:
```bash
docker-compose down
```
## Troubleshooting
Kafka Not Starting: <br> Check the logs with docker-compose logs kafka. <br>
Zookeeper Issues: Ensure the Zookeeper service is running and accessible
