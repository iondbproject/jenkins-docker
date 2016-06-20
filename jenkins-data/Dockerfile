FROM debian:jessie
MAINTAINER IonDB Project <iondbproject@gmail.com> 

# Create jenkins user
RUN useradd -d "/var/jenkins_home" -u 1000 -m -s /bin/bash jenkins

# Create and mount folders
RUN mkdir -p /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
VOLUME ["/var/log/jenkins", "/var/jenkins_home"]

USER jenkins
CMD ["echo", "Data container for Jenkins"]
