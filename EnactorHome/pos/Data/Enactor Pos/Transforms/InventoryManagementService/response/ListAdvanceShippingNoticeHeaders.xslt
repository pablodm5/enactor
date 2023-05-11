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

<xsl:template match="ns:listAdvanceShippingNoticeHeadersResponse">
	<ns:listAdvanceShippingNoticeHeadersResponse>
		<xsl:apply-templates select="*"/>
	</ns:listAdvanceShippingNoticeHeadersResponse>
</xsl:template>

<xsl:template match="retail:listAdvanceShippingNoticeHeadersResponse">
	<retail:localListAdvanceShippingNoticeHeadersResponse>
		<xsl:apply-templates select="*"/>
	</retail:localListAdvanceShippingNoticeHeadersResponse>
</xsl:template>

<xsl:template match="retail:advanceShippingNoticeHeadersList">
	<retail:expectedTransferHeadersList>
		<xsl:apply-templates select="*" mode="advanceShippingNoticeHeader"/>
	</retail:expectedTransferHeadersList>
</xsl:template>

<xsl:template match="retail:advanceShippingNoticeHeader" mode="advanceShippingNoticeHeader">
	<retail:expectedTransferHeader>
		<xsl:apply-templates select="*" mode="advanceShippingNoticeHeaderHeader"/>
	</retail:expectedTransferHeader>
</xsl:template>

<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:advanceShippingNoticeHeaderHeader elements **************************************** -->
	
<xsl:template match="retail:authorisedByUserId" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:authorisedByUserId><xsl:value-of select="."/></retail:authorisedByUserId>
</xsl:template>
	
<xsl:template match="retail:createdByUserKey" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:createdByUserId><xsl:value-of select="."/></retail:createdByUserId>
</xsl:template>
	
<xsl:template match="retail:distributionOrderKey" mode="advanceShippingNoticeHeaderHeader"> 
	<xsl:apply-templates select="retail:distributionOrderId" mode="distributionOrderKey"/>
</xsl:template>

<xsl:template match="retail:distributionOrderId" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:distributionOrderId><xsl:value-of select="."/></retail:distributionOrderId>
</xsl:template>
	
<xsl:template match="retail:advanceShippingNoticeHeaderId" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:deliveryId><xsl:value-of select="."/></retail:deliveryId>
</xsl:template>
	
<xsl:template match="retail:sourceLocationId" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:sourceLocationId><xsl:value-of select="."/></retail:sourceLocationId>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:dateTimeCreated><xsl:value-of select="."/></retail:dateTimeCreated>
</xsl:template>
	
<xsl:template match="retail:dispatchedDate" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:dateTimeDispatched><xsl:value-of select="."/></retail:dateTimeDispatched>
	<retail:dateTimeExpected><xsl:value-of select="."/></retail:dateTimeExpected>
</xsl:template>
	
<xsl:template match="retail:destinationLocationId" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:destinationLocationId><xsl:value-of select="."/></retail:destinationLocationId>
</xsl:template>
	
<xsl:template match="retail:createdAtLocationId" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:createdAtLocationId><xsl:value-of select="."/></retail:createdAtLocationId>
</xsl:template>
	
<xsl:template match="retail:status" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:status><xsl:value-of select="."/></retail:status>
</xsl:template>
	
<xsl:template match="retail:dispatchStatus" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:dispatchStatus><xsl:value-of select="."/></retail:dispatchStatus>
</xsl:template>
	
<xsl:template match="retail:createdByUserId" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:createdByUserId><xsl:value-of select="."/></retail:createdByUserId>
</xsl:template>
	
<xsl:template match="retail:voided" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:currencyId" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:currency><xsl:value-of select="."/></retail:currency>
</xsl:template>

<xsl:template match="retail:totalDispatchedUnits" mode="advanceShippingNoticeHeaderHeader"> 
	<retail:totalDispatchedUnits><xsl:value-of select="."/></retail:totalDispatchedUnits>
</xsl:template>

<xsl:template match="retail:reason" mode="advanceShippingNoticeHeaderHeader"> 
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
	
	
 <!-- Warn unhandled advanceShippingNoticeHeaderHeader tags -->
<xsl:template match="@*|*" mode="advanceShippingNoticeHeaderHeader" priority="-1">
	<xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
<xsl:template match="@*|*" mode="distributionOrderKey" priority="-1">
	<xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>

	
</xsl:stylesheet>