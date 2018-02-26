FROM jenkins/jenkins:lts

USER root

ADD grant-jenkins-access-to-docker-socket.sh /usr/local/bin/
ADD entrypoint.sh /usr/local/bin/

RUN apt-get update \
      && apt-get install -y sudo jq \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
      && chmod +x /usr/local/bin/grant-jenkins-access-to-docker-socket.sh \
      && chmod +x /usr/local/bin/entrypoint.sh

USER jenkins

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
