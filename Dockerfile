FROM jenkins/jenkins:lts

USER root

# Add Tini
ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

COPY grant-jenkins-access-to-docker-socket.sh /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/
COPY init-git-flow.sh /usr/local/bin/

RUN apt-get update \
      && apt-get install -y sudo python zip jq curl groff git git-flow\
      && rm -rf /var/lib/apt/lists/*

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py" \
  && python /tmp/get-pip.py \
  && pip install awscli --ignore-installed six

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
      && chmod +x /usr/local/bin/grant-jenkins-access-to-docker-socket.sh \
      && chmod +x /usr/local/bin/entrypoint.sh \
      && chmod +x /usr/local/bin/init-git-flow.sh

USER jenkins

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
