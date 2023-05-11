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
	<xsl:template match="service:load">
		<service:contactHistoryDetail>
			<service:contactRef><xsl:value-of select="crm:customerContactHistoryKey"></xsl:value-of></service:contactRef>
			<service:userId><xsl:value-of select="$UserId"></xsl:value-of></service:userId>
		</service:contactHistoryDetail>
	</xsl:template>
	<xsl:template match="service:contactHistoryDetail">
		<service:contactHistoryDetail>
			<service:contactRef><xsl:value-of select="crm:customerContactHistoryKey"></xsl:value-of></service:contactRef>
			<service:userId><xsl:value-of select="$UserId"></xsl:value-of></service:userId>
		</service:contactHistoryDetail>
	</xsl:template>
</xsl:stylesheet>
