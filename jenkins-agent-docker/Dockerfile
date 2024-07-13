# docker volume create jenkins_home || true


# docker run -d -p 8080:8080 -p 50000:50000 --privileged --restart=on-failure -v //var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home -v /usr/local/bin/docker:/usr/bin/docker --env JENKINS_ADMIN_ID=admin --env JENKINS_ADMIN_PASSWORD=admin --name jenkins-master <your docker image>


FROM jenkins/jenkins:lts-jdk17

USER root

# Install Docker
RUN apt-get update && \
    apt-get -y install apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable" && \
    apt-get update && \
    apt-get -y install docker-ce

RUN echo "jenkins:jenkins" | chpasswd && \
    usermod -aG sudo jenkins && \
    usermod -aG docker jenkins && \
    echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

    # Change root password to root
RUN echo "root:root" | chpasswd

USER jenkins


# don't forget to run this command on the container  : chmod 666 /var/run/docker.sock
