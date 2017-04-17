[![Build Status](https://travis-ci.org/uudashr/jenkins-docker.svg?branch=master)](https://travis-ci.org/uudashr/jenkins-docker)

# Jenkins with Docker inside

`uudashr/jenkins-docker`

The official [Jenkins](https://hub.docker.com/r/jenkinsci/jenkins/) doesn't have Docker installed. Since Docker has a lot of value when we are using [Pipeline](https://jenkins.io/doc/book/pipeline/) so that we need the Jenkins image with Docker inside.

On the Jenkins side, we are going to unitize the Docker client. Docker daemon host on different container. The reason for this is to make it simple, and go back to the concept single container service. We are going to use [Docker-in-Docker](https://hub.docker.com/_/docker) for the daemon.

Docker daemon address defined by environment variable `DOCKER_HOST` using default `tcp://docker:2375`.

```properties
DOCKER_HOST=tcp://docker:2375
```

## Local Testing

### Docker Compose
Docker compose will take care the spawning of the services.
```shell
$ docker-compose up -d
```

### Manual Docker Run
```shell
# Run the Docker daemon
$ docker run -d --privileged --name dind -v ~/temp/docker/dind:/var/lib/docker docker:dind

# Run the Jenkins
$ docker run -d --name jenkins --link dind:docker -p 8080:8080 -p 50000:50000 -v ~/temp/docker/jenkins_home:/var/jenkins_home -e DOCKER_HOST=tcp://docker:237 uudashr/jenkins-docker
```

## Reference
- https://github.com/killercentury/docker-jenkins-dind/blob/master/Dockerfile
- https://hub.docker.com/_/docker/
