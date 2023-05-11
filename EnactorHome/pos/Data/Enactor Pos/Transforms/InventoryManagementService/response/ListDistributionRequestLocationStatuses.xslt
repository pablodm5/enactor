<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor DistributionRequestLocationStatus entities to TransferOutApprovalHeader entities -->

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

<xsl:template match="ns:listDistributionRequestLocationStatusesResponse">
	<ns:listDistributionRequestLocationStatusesResponse>	
		<xsl:apply-templates select="*"/>
	</ns:listDistributionRequestLocationStatusesResponse>
</xsl:template>

<xsl:template match="retail:listDistributionRequestLocationStatusesResponse">
	<retail:localListDistributionRequestLocationStatusesResponse>
		<xsl:apply-templates select="*"/>
	</retail:localListDistributionRequestLocationStatusesResponse>
</xsl:template>

<xsl:template match="retail:distributionRequestLocationStatusesList">
	<retail:transferOutApprovalHeadersList>
		<xsl:apply-templates select="*" mode="distributionRequestLocationStatus"/>
	</retail:transferOutApprovalHeadersList>
</xsl:template>

<xsl:template match="retail:distributionRequestLocationStatusListElement" mode="distributionRequestLocationStatus">
	<retail:transferOutApprovalHeader>
		<xsl:apply-templates select="*" mode="distributionRequestLocationStatus"/>
	</retail:transferOutApprovalHeader>
</xsl:template>

<xsl:template match="retail:customerDistributionRequestLocationStatusListElement" mode="distributionRequestLocationStatus">
	<retail:customerTransferOutApprovalHeader>
		<xsl:apply-templates select="*" mode="distributionRequestLocationStatus"/>
	</retail:customerTransferOutApprovalHeader>
</xsl:template>
	
<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:distributionRequestLocationStatus elements **************************************** -->
	
<xsl:template match="retail:currencyId" mode="distributionRequestLocationStatus"> 
	<retail:currencyId><xsl:value-of select="."/></retail:currencyId>
</xsl:template>
	
<xsl:template match="retail:distributionRequestId" mode="distributionRequestLocationStatus"> 
	<retail:distributionRequestId><xsl:value-of select="."/></retail:distributionRequestId>
</xsl:template>
	
<xsl:template match="retail:destinationLocationId" mode="distributionRequestLocationStatus"> 
	<retail:destinationLocationId><xsl:value-of select="."/></retail:destinationLocationId>
</xsl:template>
	
<xsl:template match="retail:sourceLocationId" mode="distributionRequestLocationStatus"> 
	<retail:sourceLocationId><xsl:value-of select="."/></retail:sourceLocationId>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="distributionRequestLocationStatus"> 
	<retail:dateTimeCreated><xsl:value-of select="."/></retail:dateTimeCreated>
</xsl:template>
	
<xsl:template match="retail:createdAtLocationId" mode="distributionRequestLocationStatus"> 
	<retail:createdAtLocationId><xsl:value-of select="."/></retail:createdAtLocationId>
</xsl:template>
	
<xsl:template match="retail:status" mode="distributionRequestLocationStatus"> 
	<retail:status><xsl:value-of select="."/></retail:status>
</xsl:template>
	
<xsl:template match="retail:voided" mode="distributionRequestLocationStatus"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:currencyKey" mode="distributionRequestLocationStatus"> 
	<retail:currency><xsl:value-of select="."/></retail:currency>
</xsl:template>

<xsl:template match="retail:customerOrderId" mode="distributionRequestLocationStatus"> 
	<retail:customerOrderId><xsl:value-of select="."/></retail:customerOrderId>
</xsl:template>

<xsl:template match="retail:customerNumber" mode="distributionRequestLocationStatus"> 
	<retail:customerNumber><xsl:value-of select="."/></retail:customerNumber>
</xsl:template>

<xsl:template match="retail:totalRequestedQty" mode="distributionRequestLocationStatus"> 
	<retail:totalRequestedQty><xsl:value-of select="."/></retail:totalRequestedQty>
</xsl:template>

<xsl:template match="retail:reason" mode="distributionRequestLocationStatus"> 
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

<xsl:template match="retail:notes" mode="distributionRequestLocationStatus"> 
	<retail:notes><xsl:value-of select="."/></retail:notes>
</xsl:template>

<xsl:template match="retail:deliveryInstructions" mode="distributionRequestLocationStatus"> 
	<retail:deliveryInstructions><xsl:value-of select="."/></retail:deliveryInstructions>
</xsl:template>

<xsl:template match="retail:distributionRequestAddresses" mode="distributionRequestLocationStatus">
	<retail:transferOutApprovalAddresses>
		<xsl:apply-templates select="." mode="distributionRequestAddresses"/>
	</retail:transferOutApprovalAddresses>
</xsl:template>

<xsl:template match="retail:distributionRequestAddress" mode="distributionRequestAddresses">
	<retail:transferOutApprovalAddress>
		<xsl:apply-templates select="." mode="distributionRequestAddress"/>
	</retail:transferOutApprovalAddress>
</xsl:template>

<xsl:template match="retail:name" mode="distributionRequestAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:address" mode="distributionRequestAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:contactTypeId" mode="distributionRequestAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:voided" mode="distributionRequestAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>
	
	
 <!-- Warn unhandled distributionRequestLocationStatus tags -->
<xsl:template match="@*|*" mode="distributionRequestLocationStatus" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled SaleTransaction element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

	
</xsl:stylesheet>