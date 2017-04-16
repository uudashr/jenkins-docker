FROM jenkins:latest

ENV DOCKER_HOST tcp://docker:2375

USER root

RUN curl -sSL https://get.docker.com/ | sh

USER jenkins
