<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" 
	exclude-result-prefixes="xdt err fn xalan core xsd" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" 
	xmlns:err="http://www.w3.org/2005/xqt-errors" 
	xmlns:core="http://www.enactor.com/core" 
	xmlns:xalan="http://xml.apache.org/xslt" 
	xmlns:service="http://www.enactor.com/retail/product/service">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3"/>
	<xsl:param name="UserId"/>
	<xsl:param name="LocationId"/>
	<xsl:template match="service:listAll">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="core:listCriteria">
		<service:productSearch>
		<!-- Add product id filter -->
		<xsl:call-template name="AddProductIdFilter">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add product description filter -->
		<xsl:call-template name="AddProductDescriptionFilter">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add supplier description filter -->
		<xsl:call-template name="AddSupplierDescriptionFilter">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add (requesting) location id filter -->
		<xsl:if test="$LocationId">
			<service:locationId><xsl:value-of select="$LocationId"/></service:locationId>
		</xsl:if>
		<!-- Add (requesting) user id filter -->
		<xsl:if test="$UserId">
			<service:userId><xsl:value-of select="$UserId"/></service:userId>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="core:maxRows">
				<service:maxHits><xsl:value-of select="core:maxRows"/></service:maxHits>
			</xsl:when>
			<xsl:otherwise>
				<service:maxHits>50</service:maxHits>
			</xsl:otherwise>	
		</xsl:choose>		
		</service:productSearch>
	</xsl:template>
	<xsl:template name="AddProductIdFilter">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='ProductId'">
					<service:productIdInput><xsl:value-of select="core:supportValues/core:value"/></service:productIdInput>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="AddProductDescriptionFilter">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='ProductDescription'">
					<service:productDescriptionInput><xsl:value-of select="core:supportValues/core:value"></xsl:value-of></service:productDescriptionInput>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="AddSupplierDescriptionFilter">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='SupplierDescription'">
					<service:supplierDescriptionInput><xsl:value-of select="core:supportValues/core:value"></xsl:value-of></service:supplierDescriptionInput>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
