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

<xsl:template match="ns:listInventoryDispatchAddressesResponse">
	<ns:localListInventoryDispatchAddressesResponse>
		<xsl:apply-templates select="*"/>
	</ns:localListInventoryDispatchAddressesResponse>
</xsl:template>

<xsl:template match="retail:listInventoryDispatchAddressesResponse">
	<retail:localListInventoryDispatchAddressesResponse>
		<xsl:apply-templates select="*"/>
	</retail:localListInventoryDispatchAddressesResponse>
</xsl:template>

<xsl:template match="retail:inventoryDispatchAddresses">
	<retail:transferInAddresses>
		<xsl:apply-templates select="*"/>
	</retail:transferInAddresses>
</xsl:template>

<xsl:template match="retail:inventoryDispatchAddress">
	<retail:transferInAddress>
		<xsl:apply-templates select="*" mode="inventoryDispatchAddress"/>
		<xsl:copy-of select="*"/>
	</retail:transferInAddress>
</xsl:template>

<xsl:template match="retail:inventoryDispatchId" mode="inventoryDispatchAddress"> 
	<retail:transferInId><xsl:value-of select="."/></retail:transferInId>
</xsl:template>

<!-- Warn unhandled tags -->
<xsl:template match="@*|*" priority="-1" mode="inventoryDispatchAddress">
	<!-- <xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

<!-- Warn unhandled tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	

	
</xsl:stylesheet>