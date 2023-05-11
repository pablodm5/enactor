<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" exclude-result-prefixes="xdt err fn xalan" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors" 
	xmlns:xalan="http://xml.apache.org/xslt" 
	xmlns:core="http://www.enactor.com/core" 
	xmlns:crm="http://www.enactor.com/crm"
	xmlns:service="www.harrods.com/EnactorProfile/IEnactorProfile">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3" />
	
	<xsl:template match="crm:getSalespersonPerformanceSummary">		
		<GetSalesPersonProfileData xmlns="www.harrods.com/EnactorProfile">
			<request
				xmlns:d4p1="http://schemas.datacontract.org/2004/07/blHarrodsEnactorLib"
				xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
				<d4p1:CustomerSpendRequest>
					<d4p1:CostCentre i:nil="true" />
					<d4p1:Division i:nil="true" />
					<d4p1:EndDate><xsl:value-of select="crm:endDate"/></d4p1:EndDate>
					<d4p1:NumOfTopClients><xsl:value-of select="crm:maxHits"/></d4p1:NumOfTopClients>
					<d4p1:ShowByOption><xsl:value-of select="crm:orderBy"/></d4p1:ShowByOption>
					<d4p1:StartDate><xsl:value-of select="crm:startDate"/></d4p1:StartDate>
				</d4p1:CustomerSpendRequest>
				<d4p1:SalesPersonid><xsl:value-of select="crm:salespersonId"/></d4p1:SalesPersonid>
				<d4p1:YTDRequest i:nil="true" />
			</request>
		</GetSalesPersonProfileData>
	</xsl:template>	
</xsl:stylesheet>