<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" exclude-result-prefixes="xdt err fn xalan" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors" 
	xmlns:xalan="http://xml.apache.org/xslt" 
	xmlns:core="http://www.enactor.com/core" 
	xmlns:crm="http://www.enactor.com/retail"
	xmlns:service="http://www.enactor.com/crm/contactHistory/service">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3" />
	<xsl:param name="UserId" />
	<xsl:template match="service:contactHistoryDetailResponse">
		<xsl:apply-templates select="child::node()"/>
	</xsl:template>
	<xsl:template match="service:contactHistoryItem">
		<service:contactHistoryDetailResponse>
			<crm:customerContactHistory>
				<crm:customerContactTypeId><xsl:value-of select="service:typeId" /></crm:customerContactTypeId>
				<crm:description><xsl:value-of select="service:description" /></crm:description>
				<crm:userId><xsl:value-of select="service:userId" /></crm:userId>
				<crm:contactDate><xsl:value-of select="service:contactDate" /></crm:contactDate>
				<crm:contactHistoryId><xsl:value-of select="service:contactRef" /></crm:contactHistoryId>
				<crm:subject><xsl:value-of select="service:subject" /></crm:subject>
			</crm:customerContactHistory>
		</service:contactHistoryDetailResponse>
	</xsl:template>
</xsl:stylesheet>
