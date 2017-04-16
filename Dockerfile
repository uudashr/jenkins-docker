FROM jenkins:latest

ENV DOCKER_HOST tcp://docker:2375

# Install Docker as root
USER root
RUN curl -sSL https://get.docker.com/ | sh

# Switch back to user=jenkins
USER jenkins
