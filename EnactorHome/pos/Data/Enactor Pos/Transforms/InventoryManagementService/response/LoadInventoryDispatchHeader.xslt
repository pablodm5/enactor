<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor DistributionOrderHeader entities to TransferRequestHeader entities -->

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

<xsl:template match="ns:loadInventoryDispatchHeaderResponse">
	<ns:loadLocalInventoryDispatchHeaderResponse>
		<xsl:apply-templates select="*"/>
	</ns:loadLocalInventoryDispatchHeaderResponse>
</xsl:template>

<xsl:template match="retail:loadInventoryDispatchHeaderResponse">
	<retail:localLoadInventoryDispatchHeaderResponse>
		<xsl:apply-templates select="*"/>
	</retail:localLoadInventoryDispatchHeaderResponse>
</xsl:template>

<xsl:template match="retail:inventoryDispatchHeader">
	<retail:expectedTransferHeader>
		<xsl:apply-templates select="*" mode="inventoryDispatchHeader"/>
	</retail:expectedTransferHeader>
</xsl:template>

<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:inventoryDispatchHeader elements **************************************** -->
	
<xsl:template match="retail:authorisedByUserId" mode="inventoryDispatchHeader"> 
	<retail:authorisedByUserId><xsl:value-of select="."/></retail:authorisedByUserId>
</xsl:template>
	
<xsl:template match="retail:authorisedDate" mode="inventoryDispatchHeader"> 
	<retail:authorisedDate><xsl:value-of select="."/></retail:authorisedDate>
</xsl:template>
	
<xsl:template match="retail:createdByUserKey" mode="inventoryDispatchHeader"> 
	<retail:createdByUserId><xsl:value-of select="."/></retail:createdByUserId>
</xsl:template>

<xsl:template match="retail:distributionOrderId" mode="inventoryDispatchHeader"> 
	<retail:distributionOrderId><xsl:value-of select="."/></retail:distributionOrderId>
</xsl:template>
	
<xsl:template match="retail:inventoryDispatchId" mode="inventoryDispatchHeader"> 
	<retail:deliveryId><xsl:value-of select="."/></retail:deliveryId>
</xsl:template>
	
<xsl:template match="retail:sourceLocationId" mode="inventoryDispatchHeader"> 
	<retail:sourceLocationId><xsl:value-of select="."/></retail:sourceLocationId>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="inventoryDispatchHeader"> 
	<retail:dateTimeCreated><xsl:value-of select="."/></retail:dateTimeCreated>
</xsl:template>
	
<xsl:template match="retail:dispatchedDate" mode="inventoryDispatchHeader"> 
	<retail:dateTimeDispatched><xsl:value-of select="."/></retail:dateTimeDispatched>
	<retail:dateTimeExpected><xsl:value-of select="."/></retail:dateTimeExpected>
</xsl:template>
	
<xsl:template match="retail:destinationLocationId" mode="inventoryDispatchHeader"> 
	<retail:destinationLocationId><xsl:value-of select="."/></retail:destinationLocationId>
</xsl:template>
	
<xsl:template match="retail:createdAtLocationId" mode="inventoryDispatchHeader"> 
	<retail:createdAtLocationId><xsl:value-of select="."/></retail:createdAtLocationId>
</xsl:template>
	
<xsl:template match="retail:status" mode="inventoryDispatchHeader"> 
	<retail:status><xsl:value-of select="."/></retail:status>
</xsl:template>
	
<xsl:template match="retail:createdByUserId" mode="inventoryDispatchHeader"> 
	<retail:createdByUserId><xsl:value-of select="."/></retail:createdByUserId>
</xsl:template>
	
<xsl:template match="retail:voided" mode="inventoryDispatchHeader"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:currencyId" mode="inventoryDispatchHeader"> 
	<retail:currency><xsl:value-of select="."/></retail:currency>
</xsl:template>

<xsl:template match="retail:reason" mode="inventoryDispatchHeader"> 
    <retail:reason>
		<xsl:apply-templates select="." mode="reasonKey"/>
	</retail:reason>
</xsl:template>
	
<xsl:template match="retail:reasonId" mode="reasonKey"> 
	<retail:reasonId><xsl:value-of select="."/></retail:reasonId>
</xsl:template>
	
<xsl:template match="retail:regionId" mode="reasonKey"> 
	<retail:regionId>
		<xsl:attribute name="groupTypeId"><xsl:value-of select="@groupTypeId" /></xsl:attribute>
		<xsl:value-of select="."/>
	</retail:regionId>
</xsl:template>
	
	
 <!-- Warn unhandled inventoryDispatchHeader tags -->
<xsl:template match="@*|*" mode="inventoryDispatchHeader" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>
<xsl:template match="@*|*" mode="distributionOrderKey" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

	
</xsl:stylesheet>