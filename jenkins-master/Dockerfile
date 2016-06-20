FROM jenkins:1.651.3
MAINTAINER IonDB Project <iondbproject@gmail.com> 

# Pull required packages
USER root
RUN apt-get update && apt-get install -y \
		avr-libc \
		avrdude \
		binutils-avr \
		build-essential \
		cmake \
		doxygen \
		gcc-avr \
		graphviz \
		python3-pip \
		python3

# Install Arduino IDE
RUN wget -O arduinoide.tar.xz https://www.arduino.cc/download.php?f=/arduino-1.6.9-linux32.tar.xz
RUN mkdir /opt/
RUN tar --xz -xvf arduinoide.tar.xz -C /opt/

USER jenkins

# Copy in configuration
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# Prepare Jenkins Directories
USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

# Set defaults
ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"
