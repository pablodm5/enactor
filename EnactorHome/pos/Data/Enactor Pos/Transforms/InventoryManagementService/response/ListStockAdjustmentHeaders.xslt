<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor StockAdjustmentHeader entities to AdjustStockHeader entities -->

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

<xsl:template match="ns:listStockAdjustmentHeadersResponse">
	<ns:localListStockAdjustmentHeadersResponse>	
		<xsl:apply-templates select="*"/>
	</ns:localListStockAdjustmentHeadersResponse>
</xsl:template>

<xsl:template match="retail:listStockAdjustmentHeadersResponse">
	<retail:localListStockAdjustmentHeadersResponse>
		<xsl:apply-templates select="*"/>
	</retail:localListStockAdjustmentHeadersResponse>
</xsl:template>

<xsl:template match="retail:stockAdjustmentHeadersList">
	<retail:requestedStockAdjustmentHeadersList>
		<xsl:apply-templates select="*" mode="stockAdjustmentHeader"/>
	</retail:requestedStockAdjustmentHeadersList>
</xsl:template>
	
<xsl:template match="retail:stockAdjustmentHeader" mode="stockAdjustmentHeader">
	<retail:requestedStockAdjustmentHeader>
		<xsl:apply-templates select="*" mode="stockAdjustmentHeader"/>
	</retail:requestedStockAdjustmentHeader>
</xsl:template>

<xsl:template match="retail:stockAdjustmentHeaderListElement" mode="stockAdjustmentHeader">
	<retail:requestedStockAdjustmentHeader>
		<xsl:apply-templates select="*" mode="stockAdjustmentHeader"/>
	</retail:requestedStockAdjustmentHeader>
</xsl:template>

<xsl:template match="retail:customerStockAdjustmentHeaderListElement" mode="stockAdjustmentHeader">
	<retail:customerRequestedStockAdjustmentHeader>
		<xsl:apply-templates select="*" mode="stockAdjustmentHeader"/>
	</retail:customerRequestedStockAdjustmentHeader>
</xsl:template>
	
<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:stockAdjustmentHeader elements **************************************** -->
	
<xsl:template match="retail:stockAdjustmentId" mode="stockAdjustmentHeader"> 
	<retail:adjustmentId><xsl:value-of select="."/></retail:adjustmentId>
</xsl:template>
 
<xsl:template match="retail:toInventoryLocationId" mode="stockAdjustmentHeader"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:fromInventoryLocationId" mode="stockAdjustmentHeader"> 
	<xsl:copy-of select="."/>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="stockAdjustmentHeader"> 
	<retail:dateTimeCreated><xsl:value-of select="."/></retail:dateTimeCreated>
</xsl:template>
		
<xsl:template match="retail:status" mode="stockAdjustmentHeader"> 
	<retail:status><xsl:value-of select="."/></retail:status>
</xsl:template>
	
<xsl:template match="retail:voided" mode="stockAdjustmentHeader"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>

<xsl:template match="retail:totalAdjustmentUnits" mode="stockAdjustmentHeader"> 
	<retail:totalAdjustmentUnits><xsl:value-of select="."/></retail:totalAdjustmentUnits>
</xsl:template>

<xsl:template match="retail:totalAdjustmentQty" mode="stockAdjustmentHeader"> 
	<retail:totalAdjustmentQty><xsl:value-of select="."/></retail:totalAdjustmentQty>
</xsl:template>
	
<xsl:template match="retail:currencyKey" mode="stockAdjustmentHeader"> 
	<retail:currency><xsl:value-of select="."/></retail:currency>
</xsl:template>

<xsl:template match="retail:customerOrderId" mode="stockAdjustmentHeader"> 
	<retail:customerOrderId><xsl:value-of select="."/></retail:customerOrderId>
</xsl:template>

<xsl:template match="retail:customerNumber" mode="stockAdjustmentHeader"> 
	<retail:customerNumber><xsl:value-of select="."/></retail:customerNumber>
</xsl:template>

<xsl:template match="retail:reason" mode="stockAdjustmentHeader"> 
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

<xsl:template match="retail:stockAdjustmentAddresses" mode="stockAdjustmentHeader">
	<retail:requestedStockAdjustmentAddresses>
		<xsl:apply-templates select="." mode="stockAdjustmentAddresses"/>
	</retail:requestedStockAdjustmentAddresses>
</xsl:template>

<xsl:template match="retail:stockAdjustmentAddress" mode="stockAdjustmentAddresses">
	<retail:requestedStockAdjustmentAddress>
		<xsl:apply-templates select="." mode="stockAdjustmentAddress"/>
	</retail:requestedStockAdjustmentAddress>
</xsl:template>

<xsl:template match="retail:name" mode="stockAdjustmentAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:address" mode="stockAdjustmentAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:contactTypeId" mode="stockAdjustmentAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:voided" mode="stockAdjustmentAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>
	
	
 <!-- Warn unhandled stockAdjustmentHeader tags -->
<xsl:template match="@*|*" mode="stockAdjustmentHeader" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled SaleTransaction element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

	
</xsl:stylesheet>