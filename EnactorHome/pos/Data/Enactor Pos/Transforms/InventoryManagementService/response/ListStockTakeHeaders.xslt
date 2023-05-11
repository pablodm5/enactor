<?xml version="1.0" encoding="UTF-8" ?>

<!-- Transform central StockTakeHeader entities to local StockTakeHeader entities -->

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

<xsl:template match="ns:listStockTakeHeadersResponse">
	<ns:listStockTakeHeadersResponse>	
		<xsl:apply-templates select="*"/>
	</ns:listStockTakeHeadersResponse>
</xsl:template>

<xsl:template match="retail:listStockTakeHeadersResponse">
	<retail:localListStockTakeHeadersResponse>
		<xsl:apply-templates select="*"/>
	</retail:localListStockTakeHeadersResponse>
</xsl:template>

<xsl:template match="retail:stockTakeHeadersList">
	<retail:localStockTakeHeadersList>
		<xsl:apply-templates select="*"/>
	</retail:localStockTakeHeadersList>
</xsl:template>

<xsl:template match="retail:stockTakeHeader">
	<retail:localStockTakeHeader>
		<xsl:apply-templates select="*" mode="stockTakeHeader"/>
	</retail:localStockTakeHeader>
</xsl:template>
	
<!-- Log any unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<xsl:template match="retail:stockTakeId" mode="stockTakeHeader"> 
	<retail:stockTakeId><xsl:value-of select="."/></retail:stockTakeId>
</xsl:template>
	
<xsl:template match="retail:recountCount" mode="stockTakeHeader"> 
	<retail:recountCount><xsl:value-of select="."/></retail:recountCount>
</xsl:template>
	
<!-- Ignore all other sub-tags -->
<xsl:template match="@*|*" priority="-1" mode="stockTakeHeader"/>

</xsl:stylesheet>