FROM jenkins/jenkins:lts

USER root

# Add Tini
ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

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
