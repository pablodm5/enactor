<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor StockAdjustmentIem entities to RequestedStockAdjustmentIem entities -->

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

<xsl:template match="ns:loadStockAdjustmentItemsResponse">
	<ns:loadStockAdjustmentItemsResponse>	
		<xsl:apply-templates select="*"/>
	</ns:loadStockAdjustmentItemsResponse>
</xsl:template>

<xsl:template match="retail:loadStockAdjustmentItemsResponse"> 
	<retail:localLoadStockAdjustmentItemsResponse>
		<xsl:apply-templates select="*"/>
	</retail:localLoadStockAdjustmentItemsResponse>
</xsl:template>

<xsl:template match="retail:stockAdjustmentItemsList"> 
	<retail:requestedStockAdjustmentItemsList>
		<xsl:apply-templates select="*"/>
	</retail:requestedStockAdjustmentItemsList>
</xsl:template>

<xsl:template match="retail:stockAdjustmentItem">
	<retail:requestedStockAdjustmentItem>
		<xsl:apply-templates select="*" mode="stockAdjustmentItem"/>
	</retail:requestedStockAdjustmentItem>
</xsl:template>

<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:stockAdjustmentItem elements **************************************** -->
	
<xsl:template match="retail:lineNumber" mode="stockAdjustmentItem"> 
	<retail:lineNumber><xsl:value-of select="."/></retail:lineNumber>
</xsl:template>
	
<xsl:template match="retail:stockAdjustmentId" mode="stockAdjustmentItem"> 
	<retail:adjustmentId><xsl:value-of select="."/></retail:adjustmentId>
</xsl:template>
	
<xsl:template match="retail:productId" mode="stockAdjustmentItem"> 
	<retail:productId><xsl:value-of select="."/></retail:productId>
</xsl:template>
	
<xsl:template match="retail:qty" mode="stockAdjustmentItem"> 
	<retail:quantity><xsl:value-of select="."/></retail:quantity>
</xsl:template>
	
<xsl:template match="retail:voided" mode="stockAdjustmentItem"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="stockAdjustmentItem"> 
	<retail:createdDate><xsl:value-of select="."/></retail:createdDate>
</xsl:template>
	
	
 <!-- Warn unhandled stockAdjustmentItem tags -->
<xsl:template match="@*|*" mode="stockAdjustmentItem" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled SaleTransaction element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

	
</xsl:stylesheet>