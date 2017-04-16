jenkins_home=${HOME}/temp/docker/jenkins_home
dind_home=${HOME}/temp/docker/dind_home

build:
	@docker build -t jenkins-docker .

clean:
	@if [ -d "${jenkins_home}" ]; then \
		rm -rf ${jenkins_home}; \
	fi

clean:
	@if [ -d "${jenkins_home}" ]; then \
		rm -rf ${jenkins_home}; \
	fi

clean-workspace:
	@rm -rf ${jenkins_home}/workspace/*

backup:
	tar cvf - ${jenkins_home} | gzip -9 > backups/jenkins_home-$(shell date '+%Y%m%d_%H%M%S').tar.gz
