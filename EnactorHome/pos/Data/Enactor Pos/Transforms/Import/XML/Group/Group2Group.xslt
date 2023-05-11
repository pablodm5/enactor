<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:java="http://xml.apache.org/xalan/java"
	xmlns:groupUtils="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils"
	
	xmlns:retail="http://www.enactor.com/retail"
	xmlns:core="http://www.enactor.com/core"
	
	exclude-result-prefixes="xalan groupUtils"
>
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	
	<xsl:template match="@*|node()" priority="-1">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="retail:brand">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:costCentreGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:customerGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:employeeGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:exchangeRateGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:fasica">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:localLocationArea">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:locationArea">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:menuGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:mmGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:priceGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:productGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:range">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:region">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:serviceLevelGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:taxRegion">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:terminalGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
	<xsl:template match="retail:userGroup">
		<xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
	</xsl:template>
	
    <xsl:template match="retail:promotionGroup">
            <xsl:copy-of select="java:com.enactor.mfc.group.util.GroupXSLTTransformUtils.internaliseGroup(.)"/>
    </xsl:template>
</xsl:stylesheet>