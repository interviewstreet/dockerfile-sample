FROM ubuntu:16.04

# Clean and update package manager repositories
RUN rm -rf /var/lib/apt/lists/* && apt-get clean
RUN apt-get update

# Create and switch to non-root user
RUN apt-get install -y sudo
RUN useradd -u 1000 -G users,sudo,root -d /home/user --shell /bin/bash -m user && usermod -p "*" user
RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER user
ENV HOME /home/user

# Install Kafka and its dependencies
RUN sudo apt-get install -y curl default-jdk zookeeperd
RUN sudo mkdir -p /opt/mdp
RUN curl -s "https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz" | sudo tar xzvf -  -C /opt/mdp

# Copy configuration file(ss)
COPY kafka.conf /opt/mdp/kafka_2.11-1.0.0/config/server.properties

# Set up environment variables
ENV PATH=${PATH}:/opt/mdp/kafka_2.11-1.0.0/bin
