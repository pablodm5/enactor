<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor DistributionRequestItem entities to TransferRequestItem entities -->

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

<xsl:template match="ns:loadDistributionRequestItemsResponse">
	<ns:loadDistributionRequestItemsResponse>	
		<xsl:apply-templates select="*"/>
	</ns:loadDistributionRequestItemsResponse>
</xsl:template>

<xsl:template match="retail:loadDistributionRequestItemsResponse"> 
	<retail:localLoadDistributionRequestItemsResponse>
		<xsl:apply-templates select="*"/>
	</retail:localLoadDistributionRequestItemsResponse>
</xsl:template>

<xsl:template match="retail:distributionRequestItemsList"> 
	<retail:transferOutApprovalItemsList>
		<xsl:apply-templates select="*"/>
	</retail:transferOutApprovalItemsList>
</xsl:template>

<xsl:template match="retail:distributionRequestItem">
	<retail:transferOutApprovalItem>
		<xsl:apply-templates select="*" mode="distributionRequestItem"/>
	</retail:transferOutApprovalItem>
</xsl:template>
	
<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:distributionRequestItem elements **************************************** -->

<xsl:template match="retail:lineNumber" mode="distributionRequestItem"> 
	<retail:lineNumber><xsl:value-of select="."/></retail:lineNumber>
</xsl:template>
	
<xsl:template match="retail:distributionRequestId" mode="distributionRequestItem"> 
	<retail:distributionRequestId><xsl:value-of select="."/></retail:distributionRequestId>
</xsl:template>
	
<xsl:template match="retail:productId" mode="distributionRequestItem"> 
	<retail:productId><xsl:value-of select="."/></retail:productId>
</xsl:template>
	
<xsl:template match="retail:requestedQty" mode="distributionRequestItem"> 
	<retail:requestedQuantity><xsl:value-of select="."/></retail:requestedQuantity>
</xsl:template>
	
<xsl:template match="retail:dispatchedQty" mode="distributionRequestItem">
	<retail:dispatchedQuantity><xsl:value-of select="."/></retail:dispatchedQuantity>
</xsl:template>
	
<xsl:template match="retail:receivedQty" mode="distributionRequestItem">
	<retail:receivedQuantity><xsl:value-of select="."/></retail:receivedQuantity>
</xsl:template>
	
<xsl:template match="retail:rejectedQty" mode="distributionRequestItem">
	<retail:rejectedQuantity><xsl:value-of select="."/></retail:rejectedQuantity>
</xsl:template>
	
<xsl:template match="retail:voided" mode="distributionRequestItem"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="distributionRequestItem"> 
	<retail:createdDate><xsl:value-of select="."/></retail:createdDate>
</xsl:template>
	
	
 <!-- Warn unhandled distributionRequestItem tags -->
<xsl:template match="@*|*" mode="distributionRequestItem" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled SaleTransaction element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

	
</xsl:stylesheet>