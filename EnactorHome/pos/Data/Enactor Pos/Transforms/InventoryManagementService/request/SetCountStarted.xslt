<?xml version="1.0" encoding="UTF-8" ?>

<!--  SetCountStarted operation local request to central request -->

<xsl:stylesheet version="2.0" 
	exclude-result-prefixes="java xdt err fn xalan core retail xsd" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" 
	xmlns:err="http://www.w3.org/2005/xqt-errors" 
	xmlns:exslt="http://exslt.org/common"
	xmlns:core="http://www.enactor.com/core" 
	xmlns:math="http://exslt.org/math"
	xmlns:retail="http://www.enactor.com/retail" 
	xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:java="http://xml.apache.org/xalan/java"
	xmlns:ns="http://www.enactor.com/service/InventoryManagementService"
>
	
<xsl:output method="xml" indent="yes" />

<!-- This is the wrapper tag, added by the invoke action. It must remain intact after the transform. -->
<xsl:template match="ns:setCountStarted">
	<ns:setCountStarted>	
		<xsl:apply-templates select="*"/>
	</ns:setCountStarted>	
</xsl:template>

<xsl:template match="retail:localSetCountStartedRequest">
	<retail:setCountStartedRequest>
		<xsl:apply-templates select="*"/>
	</retail:setCountStartedRequest>
</xsl:template>

<xsl:template match="retail:stockTakeId"> 
	<retail:stockTakeId><xsl:value-of select="."/></retail:stockTakeId>
</xsl:template>

<xsl:template match="retail:userId"> 
	<retail:userId><xsl:value-of select="."/></retail:userId>
</xsl:template>

<xsl:template match="retail:deviceId"> 
	<retail:deviceId><xsl:value-of select="."/></retail:deviceId>
</xsl:template>

<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
</xsl:stylesheet>