# escape=`
FROM enactordev-on.azurecr.io/enactorstandardbase/win/emr:BASE-IMAGE-TAG-TOKEN

LABEL Description="IMAGE-CUSTOMER-NAME-TOKEN - EMR" 
LABEL Vendor="Enactor" 
LABEL StandardVersion="BUILD-IMAGE-TAG-TOKEN"

ADD root c:\

CMD ["C:\\enactor\\shared\\tomcat\\bin\\run.bat", "run"]

