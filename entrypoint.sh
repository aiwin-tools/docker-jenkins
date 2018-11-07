#!/bin/bash -x

sudo /usr/local/bin/grant-jenkins-access-to-docker-socket.sh
/usr/local/bin/init-git-flow.sh
/bin/tini -s -- /usr/local/bin/jenkins.sh
