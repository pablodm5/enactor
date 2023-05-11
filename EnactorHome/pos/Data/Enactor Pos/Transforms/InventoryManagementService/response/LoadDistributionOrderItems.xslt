<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor DistributionOrderItem entities to TransferRequestItem entities -->

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

<xsl:template match="ns:loadDistributionOrderItemsResponse">
	<ns:loadDistributionOrderItemsResponse>	
		<xsl:apply-templates select="*"/>
	</ns:loadDistributionOrderItemsResponse>
</xsl:template>

<xsl:template match="retail:loadDistributionOrderItemsResponse"> 
	<retail:localLoadDistributionOrderItemsResponse>
		<xsl:apply-templates select="*"/>
	</retail:localLoadDistributionOrderItemsResponse>
</xsl:template>

<xsl:template match="retail:distributionOrderItemsList"> 
	<retail:transferRequestItemsList>
		<xsl:apply-templates select="*"/>
	</retail:transferRequestItemsList>
</xsl:template>

<xsl:template match="retail:distributionOrderItem">
	<retail:transferRequestItem>
		<xsl:apply-templates select="*" mode="distributionOrderItem"/>
	</retail:transferRequestItem>
</xsl:template>
	
<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:distributionOrderItem elements **************************************** -->

<xsl:template match="retail:lineNumber" mode="distributionOrderItem"> 
	<retail:lineNumber><xsl:value-of select="."/></retail:lineNumber>
</xsl:template>
	
<xsl:template match="retail:distributionOrderId" mode="distributionOrderItem"> 
	<retail:distributionOrderId><xsl:value-of select="."/></retail:distributionOrderId>
</xsl:template>
	
<xsl:template match="retail:productId" mode="distributionOrderItem"> 
	<retail:productId><xsl:value-of select="."/></retail:productId>
</xsl:template>
	
<xsl:template match="retail:containerId" mode="distributionOrderItem"> 
	<retail:containerId><xsl:value-of select="."/></retail:containerId>
</xsl:template>
	
<xsl:template match="retail:transferQty" mode="distributionOrderItem"> 
	<retail:requestedQuantity><xsl:value-of select="."/></retail:requestedQuantity>
</xsl:template>
	
<xsl:template match="retail:dispatchedQty" mode="distributionOrderItem">
	<retail:dispatchedQuantity><xsl:value-of select="."/></retail:dispatchedQuantity>
</xsl:template>
	
<xsl:template match="retail:receivedQty" mode="distributionOrderItem">
	<retail:receivedQuantity><xsl:value-of select="."/></retail:receivedQuantity>
</xsl:template>
	
<xsl:template match="retail:rejectedQty" mode="distributionOrderItem">
	<retail:rejectedQuantity><xsl:value-of select="."/></retail:rejectedQuantity>
</xsl:template>
	
<xsl:template match="retail:voided" mode="distributionOrderItem"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="distributionOrderItem"> 
	<retail:createdDate><xsl:value-of select="."/></retail:createdDate>
</xsl:template>
	
	
 <!-- Warn unhandled distributionOrderItem tags -->
<xsl:template match="@*|*" mode="distributionOrderItem" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled SaleTransaction element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

	
</xsl:stylesheet>