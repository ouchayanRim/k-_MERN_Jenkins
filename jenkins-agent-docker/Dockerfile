# docker volume create jenkins_home || true
# docker run -d -p 8080:8080 -p 50000:50000 --privileged --restart=on-failure -v //var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home -v /usr/local/bin/docker:/usr/bin/docker --env JENKINS_ADMIN_ID=admin --env JENKINS_ADMIN_PASSWORD=admin --name jenkins-master <your docker image>


FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \ 
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce

RUN usermod -a -G docker jenkins

USER jenkins