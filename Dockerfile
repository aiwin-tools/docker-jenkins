FROM jenkins/jenkins:lts

USER root

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

COPY --chown=jenkins:jenkins grant-jenkins-access-to-docker-socket.sh /usr/local/bin/
COPY --chown=jenkins:jenkins entrypoint.sh /usr/local/bin/
COPY --chown=jenkins:jenkins init-git-flow.sh /usr/local/bin/

RUN apt-get update \
      && apt-get install -y sudo python zip jq curl groff git git-flow\
      && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
  && unzip /tmp/awscliv2.zip -d /tmp \
  && /tmp/aws/install 

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
      && chmod +x /usr/local/bin/grant-jenkins-access-to-docker-socket.sh \
      && chmod +x /usr/local/bin/entrypoint.sh \
      && chmod +x /usr/local/bin/init-git-flow.sh

USER jenkins

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
