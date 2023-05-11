# Jenkins Master Container
FROM jenkins/jenkins:lts
MAINTAINER tharinda.methmal@enactor.co.uk

#setup Environment vars : AD_USR,AD_PWD,JENKINS_ADMIN_USR,JENKINS_ADMIN_PWD are specified at runtime
ENV \
  JAVA_OPTS="-Xmx3072M -Djenkins.install.runSetupWizard=false" \
  JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log" \
  AD_USR="" \
  AD_PWD="" \
  AZURE_VM_OS_USR="" \
  AZURE_VM_OS_PWD="" \
  JENKINS_ADMIN_USR="" \
  JENKINS_ADMIN_PWD=""

# Switch to Root User
USER root

#setup ansible and required modules
RUN sh -c 'echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible.list' && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367  && \
    apt-get update && \
    apt-get install -y ansible python-pip && \
    pip install pywinrm

#Copy ansible playbooks
COPY --chown=root ansible/playbooks/push-release-to-windows_server.yml /playbooks/push-release-to-windows_server.yml


# Setup default folders
RUN mkdir /var/log/jenkins && \
    chown -R jenkins:jenkins /var/log/jenkins && \
    mkdir /mnt/Releases && \
    chown -R jenkins:jenkins /mnt/Releases

USER jenkins

#Copy config files to perform below tasks :
#	setup admin user for Jenkins
#	setup credentials
#	disable script security
#	install groovy
#	install maven
#	setup global configuration for maven
#	setup initial seed job
COPY  --chown=jenkins Jenkins/jenkins_home /var/jenkins_home/

# Install default plugins
RUN /usr/local/bin/install-plugins.sh \
	conditional-buildstep \
	config-file-provider \
	credentials \
	credentials-binding \
	hidden-parameter \
	job-dsl \
	matrix-auth \
	maven-plugin \
	pipeline-maven \
	subversion \
	tasks \
	timestamper \
	workflow-aggregator \
	ws-cleanup \
	groovy 
