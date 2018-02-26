# docker-jenkins

[Docker](https://www.docker.com/) image of [Jenkins](https://jenkins.io/) with necessary tools for build our projects

Jenkins is the leading open source automation server, provides hundreds of plugins to support building, deploying and automating any project. This image adds several tools used by our integration and deployment processes, like jq, curl, etc

Usage
--------------

    docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home aiwin/jenkins-base


Build
--------------

Run `build.sh` script to build and push the image to default location

    aiwin/jenkins-base:latest

If you want to build and push the image to diferent location, define the following
variables before the execution of the script:

- REPOSITORY. Docker repository
- REGISTRY. Docker registry
- TAG. Tag or version
