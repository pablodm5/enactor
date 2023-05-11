What's this Container for?
==========================
This Dockerfile builds a Jenkins Master with a job configured to build and archive a Training
build. 

How to build?
=============
> docker build -t training-jenkins --pull .

How to run interactively?
=========================


 docker run -p 8080:8080 -p 50000:50000 --name=training-jenkins -it   -e "AD_USR=<Active Directory Username>" -e "AD_PWD=<Active Directory Password>"  \
 -e "JENKINS_ADMIN_USR=<Jenkins Admin User>" -e "JENKINS_ADMIN_PWD=<Jenkins Admin Password>" -e "AZURE_VM_OS_USR=<Windows OS Username>"  -e "AZURE_VM_OS_PWD=<Windows OS Password>"\
 training-jenkins
  
Note that JENKINS_ADMIN_USR and JENKINS_ADMIN_PWD are optional; if not defined, no admin user
will be defined and anyone can log onto the Jenkins system.
Note that AZURE_VM_OS_USR and AZURE_VM_OS_PWD are optional; if not defined, no credentials 
will be defined Jenkins credentials store. Therefore any build jobs that are required to 
connect to a remote azure machine will fail.

How to connect to Docker image shell?
=====================================
> docker exec -it training-jenkins bash

How to connect to Jenkins UI?
=============================
http://localhost:8080 
