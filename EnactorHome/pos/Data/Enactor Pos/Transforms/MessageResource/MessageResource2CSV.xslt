<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:core="http://www.enactor.com/core" >

	<xsl:output method="text" indent="yes" />

<xsl:template match="core:messageResource[starts-with(string(core:basename),'Administration') or starts-with(string(core:basename),'com.enactor.administration')]">
	<xsl:apply-templates select="core:message"/>
</xsl:template>

<xsl:template match="core:messageResource[starts-with(string(core:basename),'CashManagement') or starts-with(string(core:basename),'com.enactor.cashManagement')]">
	<xsl:apply-templates select="core:message"/>	
</xsl:template>


<xsl:template match="core:messageResource[starts-with(string(core:basename),'Pos')]">
	<xsl:apply-templates select="core:message"/>
</xsl:template>

<xsl:template match="core:messageResource[starts-with(string(core:basename),'CRM')]">
	<xsl:apply-templates select="core:message"/>
</xsl:template>

<xsl:template match="core:messageResource[starts-with(string(core:basename),'Maintenance') or starts-with(string(core:basename),'com.enactor.maintenance')]">
	<xsl:apply-templates select="core:message"/>
</xsl:template>

<xsl:template match="core:messageResource" priority="-1">
	<xsl:apply-templates select="core:message"/>
</xsl:template>

<xsl:template match="core:message">	
<xsl:value-of select="../core:basename" /><xsl:text>,</xsl:text><xsl:value-of select="../core:localeKey" /><xsl:text>,</xsl:text><xsl:value-of select="../core:localeKey/@country" /><xsl:text>,</xsl:text><xsl:value-of select="../core:localeKey/@variant" /><xsl:text>,</xsl:text><xsl:value-of select="@key" /><xsl:text>,"</xsl:text><xsl:value-of select="." /><xsl:text>"
</xsl:text>
</xsl:template>

</xsl:stylesheet>
