# escape=`
FROM enactordev-on.azurecr.io/enactorstandardbase/win/pdp:BASE-IMAGE-TAG-TOKEN

LABEL Description="IMAGE-CUSTOMER-NAME-TOKEN - PDP" 
LABEL Vendor="Enactor" 
LABEL StandardVersion="BUILD-IMAGE-TAG-TOKEN"

COPY root c:\

RUN IF EXIST C:\ENACTOR\SHARED\LICENCE\LICENCE.XML DEL /Q  C:\ENACTOR\SHARED\LICENCE\LICENCE.XML

CMD ["C:\\enactor\\app\\scripts\\run.bat"]
