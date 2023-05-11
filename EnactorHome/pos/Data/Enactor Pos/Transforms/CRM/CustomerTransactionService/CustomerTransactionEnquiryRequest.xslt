<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" 
	exclude-result-prefixes="xdt err fn xalan core crm xsd" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" 
	xmlns:err="http://www.w3.org/2005/xqt-errors" 
	xmlns:core="http://www.enactor.com/core" 
	xmlns:crm="http://www.enactor.com/crm" 
	xmlns:xalan="http://xml.apache.org/xslt" 
	xmlns:service="http://www.enactor.com/retail/customerTransaction/service">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3"/>
	<xsl:param name="UserId"/>
	<xsl:template match="service:listAll">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="core:listCriteria">
		<service:customerTransactionEnquiry>
		<!-- Add customer number filter -->
		<xsl:call-template name="AddTransactionIdFilter">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add (requesting) user id filter -->
		<xsl:if test="$UserId">
			<service:userId><xsl:value-of select="$UserId"/></service:userId>
		</xsl:if>
			<service:maxHits><xsl:value-of select="core:maxRows"/></service:maxHits>
		</service:customerTransactionEnquiry>
	</xsl:template>
	<xsl:template name="AddTransactionIdFilter">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='TransactionId'">
					<service:transactionRef><xsl:value-of select="core:supportValues/core:value"/></service:transactionRef>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
