#!/bin/bash -x

sudo /usr/local/bin/grant-jenkins-access-to-docker-socket.sh
/bin/tini -s -- /usr/local/bin/jenkins.sh
