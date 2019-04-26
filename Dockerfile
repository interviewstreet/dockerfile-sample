FROM gcr.io/che-fullstack/rba-base:latest

# Clean and update package manager repositories
RUN sudo rm -rf /var/lib/apt/lists/* && sudo apt-get clean
RUN sudo apt-get update

# Install Kafka and its dependencies
RUN sudo apt-get install -y default-jdk zookeeperd
RUN sudo mkdir -p /opt/mdp
RUN curl -s "https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz" | sudo tar xzvf -  -C /opt/mdp

# Copy configuration file(ss)
COPY kafka.conf /opt/mdp/kafka_2.11-1.0.0/config/server.properties

# Set up environment variables
ENV PATH=${PATH}:/opt/mdp/kafka_2.11-1.0.0/bin
