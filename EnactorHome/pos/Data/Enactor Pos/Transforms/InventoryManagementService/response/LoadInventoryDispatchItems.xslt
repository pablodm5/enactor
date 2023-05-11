<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor inventoryDispatchItem entities to TransferRequestItem entities -->

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

<xsl:template match="ns:loadInventoryDispatchItemsResponse">
	<ns:loadInventoryDispatchItemsResponse>	
		<xsl:apply-templates select="*"/>
	</ns:loadInventoryDispatchItemsResponse>
</xsl:template>

<xsl:template match="retail:loadInventoryDispatchItemsResponse"> 
	<retail:localLoadInventoryDispatchItemsResponse>
		<xsl:apply-templates select="*"/>
	</retail:localLoadInventoryDispatchItemsResponse>
</xsl:template>

<xsl:template match="retail:inventoryDispatchItemsList"> 
	<retail:expectedTransferItemsList>
		<xsl:apply-templates select="*"/>
	</retail:expectedTransferItemsList>
</xsl:template>

<xsl:template match="retail:inventoryDispatchItem">
	<retail:expectedTransferItem>
		<xsl:apply-templates select="*" mode="inventoryDispatchItem"/>
	</retail:expectedTransferItem>
</xsl:template>

<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:inventoryDispatchItem elements **************************************** -->
	
<xsl:template match="retail:lineNumber" mode="inventoryDispatchItem"> 
	<retail:lineNumber><xsl:value-of select="."/></retail:lineNumber>
</xsl:template>
	
<xsl:template match="retail:inventoryDispatchId" mode="inventoryDispatchItem"> 
	<retail:deliveryId><xsl:value-of select="."/></retail:deliveryId>
</xsl:template>
	
<xsl:template match="retail:destinationInventoryLocationId" mode="inventoryDispatchItem"> 
	<xsl:apply-templates select="*" mode="inventoryLocationKey"></xsl:apply-templates>
</xsl:template>
	
<xsl:template match="retail:containerId" mode="inventoryDispatchItem"> 
	<retail:containerId><xsl:value-of select="."/></retail:containerId>
</xsl:template>
	
<xsl:template match="retail:inventoryContainerId" mode="inventoryLocationKey"> 
	<retail:containerId><xsl:value-of select="."/></retail:containerId>
</xsl:template>

<xsl:template match="retail:productId" mode="inventoryDispatchItem"> 
	<retail:productId><xsl:value-of select="."/></retail:productId>
</xsl:template>
	
<xsl:template match="retail:dispatchedQty" mode="inventoryDispatchItem"> 
	<retail:expectedQuantity><xsl:value-of select="."/></retail:expectedQuantity>
</xsl:template>
	
<xsl:template match="retail:voided" mode="inventoryDispatchItem"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="inventoryDispatchItem"> 
	<retail:createdDate><xsl:value-of select="."/></retail:createdDate>
</xsl:template>
	
	
 <!-- Warn unhandled inventoryDispatchItem tags -->
<xsl:template match="@*|*" mode="inventoryDispatchItem" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled SaleTransaction element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

<xsl:template match="@*|*" mode="inventoryLocationKey" priority="-1">
</xsl:template>

	
</xsl:stylesheet>