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

<xsl:template match="ns:listDistributionOrderHeadersResponse">
	<ns:listDistributionOrderHeadersResponse>	
		<xsl:apply-templates select="*"/>
	</ns:listDistributionOrderHeadersResponse>
</xsl:template>

<xsl:template match="retail:listDistributionOrderHeadersResponse">
	<retail:localListDistributionOrderHeadersResponse>
		<xsl:apply-templates select="*"/>
	</retail:localListDistributionOrderHeadersResponse>
</xsl:template>

<xsl:template match="retail:distributionOrderHeadersList">
	<retail:transferRequestHeadersList>
		<xsl:apply-templates select="*" mode="distributionOrderHeader"/>
	</retail:transferRequestHeadersList>
</xsl:template>
	
<xsl:template match="retail:distributionOrderHeader" mode="distributionOrderHeader">
	<retail:transferRequestHeader>
		<xsl:apply-templates select="*" mode="distributionOrderHeader"/>
	</retail:transferRequestHeader>
</xsl:template>

<xsl:template match="retail:distributionOrderHeaderListElement" mode="distributionOrderHeader">
	<retail:transferRequestHeader>
		<xsl:apply-templates select="*" mode="distributionOrderHeader"/>
	</retail:transferRequestHeader>
</xsl:template>

<xsl:template match="retail:customerDistributionOrderHeaderListElement" mode="distributionOrderHeader">
	<retail:customerTransferRequestHeader>
		<xsl:apply-templates select="*" mode="distributionOrderHeader"/>
	</retail:customerTransferRequestHeader>
</xsl:template>
	
<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:distributionOrderHeader elements **************************************** -->
	
<xsl:template match="retail:distributionOrderId" mode="distributionOrderHeader"> 
	<retail:distributionOrderId><xsl:value-of select="."/></retail:distributionOrderId>
</xsl:template>
	
<xsl:template match="retail:destinationLocationId" mode="distributionOrderHeader"> 
	<retail:destinationLocationId><xsl:value-of select="."/></retail:destinationLocationId>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="distributionOrderHeader"> 
	<retail:dateTimeCreated><xsl:value-of select="."/></retail:dateTimeCreated>
</xsl:template>
	
<xsl:template match="retail:createdAtLocationId" mode="distributionOrderHeader"> 
	<retail:createdAtLocationId><xsl:value-of select="."/></retail:createdAtLocationId>
</xsl:template>
	
<xsl:template match="retail:status" mode="distributionOrderHeader"> 
	<retail:status><xsl:value-of select="."/></retail:status>
</xsl:template>
	
<xsl:template match="retail:voided" mode="distributionOrderHeader"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:currencyKey" mode="distributionOrderHeader"> 
	<retail:currency><xsl:value-of select="."/></retail:currency>
</xsl:template>

<xsl:template match="retail:customerOrderId" mode="distributionOrderHeader"> 
	<retail:customerOrderId><xsl:value-of select="."/></retail:customerOrderId>
</xsl:template>

<xsl:template match="retail:customerNumber" mode="distributionOrderHeader"> 
	<retail:customerNumber><xsl:value-of select="."/></retail:customerNumber>
</xsl:template>

<xsl:template match="retail:totalTransferQty" mode="distributionOrderHeader"> 
	<retail:totalTransferQty><xsl:value-of select="."/></retail:totalTransferQty>
</xsl:template>

<xsl:template match="retail:reason" mode="distributionOrderHeader"> 
    <retail:reason>
		<xsl:apply-templates select="." mode="reasonKey"/>
	</retail:reason>
</xsl:template>
	
<xsl:template match="retail:reasonId" mode="reasonKey"> 
	<retail:reasonId><xsl:value-of select="."/></retail:reasonId>
</xsl:template>
	
<xsl:template match="retail:regionId" mode="reasonKey"> 
	<retail:regionId>
	    <xsl:attribute name="groupHierarchyId"><xsl:value-of select="@groupHierarchyId" /></xsl:attribute>
		<xsl:attribute name="groupTypeId"><xsl:value-of select="@groupTypeId" /></xsl:attribute>
		<xsl:value-of select="."/>
	</retail:regionId>
</xsl:template>

<xsl:template match="retail:notes" mode="distributionOrderHeader"> 
	<retail:notes><xsl:value-of select="."/></retail:notes>
</xsl:template>

<xsl:template match="retail:deliveryInstructions" mode="distributionOrderHeader"> 
	<retail:deliveryInstructions><xsl:value-of select="."/></retail:deliveryInstructions>
</xsl:template>

<xsl:template match="retail:distributionOrderAddresses" mode="distributionOrderHeader">
	<retail:transferRequestAddresses>
		<xsl:apply-templates select="." mode="distributionOrderAddresses"/>
	</retail:transferRequestAddresses>
</xsl:template>

<xsl:template match="retail:distributionOrderAddress" mode="distributionOrderAddresses">
	<retail:transferRequestAddress>
		<xsl:apply-templates select="." mode="distributionOrderAddress"/>
	</retail:transferRequestAddress>
</xsl:template>

<xsl:template match="retail:name" mode="distributionOrderAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:address" mode="distributionOrderAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:contactTypeId" mode="distributionOrderAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:voided" mode="distributionOrderAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>
	
	
 <!-- Warn unhandled distributionOrderHeader tags -->
<xsl:template match="@*|*" mode="distributionOrderHeader" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled SaleTransaction element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

	
</xsl:stylesheet>