<?xml version="1.0" encoding="UTF-8" ?>

<!--  GetInventoryDispatchHeader operation local request to central request -->

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
<xsl:template match="ns:loadInventoryDispatchHeader">
	<ns:loadInventoryDispatchHeader>	
		<xsl:apply-templates select="*"/>
	</ns:loadInventoryDispatchHeader>	
</xsl:template>

<xsl:template match="retail:localLoadInventoryDispatchHeaderRequest">
	<retail:loadInventoryDispatchHeaderRequest>
		<xsl:apply-templates select="*"/>
	</retail:loadInventoryDispatchHeaderRequest>
</xsl:template>

<xsl:template match="retail:inventoryDispatchId"> 
	<retail:inventoryDispatchId><xsl:value-of select="."/></retail:inventoryDispatchId>
</xsl:template>

<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
</xsl:stylesheet>