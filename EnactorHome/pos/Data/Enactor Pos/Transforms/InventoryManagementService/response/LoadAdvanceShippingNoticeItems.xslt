<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor AdvanceShippingNoticeItem entities to SupplierDeliveryReceiptItem entities -->

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

<xsl:template match="ns:loadAdvanceShippingNoticeItemsResponse">
	<ns:loadAdvanceShippingNoticeItemsResponse>	
		<xsl:apply-templates select="*"/>
	</ns:loadAdvanceShippingNoticeItemsResponse>
</xsl:template>

<xsl:template match="retail:loadAdvanceShippingNoticeItemsResponse"> 
	<retail:localLoadAdvanceShippingNoticeItemsResponse>
		<xsl:apply-templates select="*"/>
	</retail:localLoadAdvanceShippingNoticeItemsResponse>
</xsl:template>

<xsl:template match="retail:advanceShippingNoticeItemsList"> 
	<retail:expectedSupplierDeliveryItemsList>
		<xsl:apply-templates select="*"/>
	</retail:expectedSupplierDeliveryItemsList>
</xsl:template>

<xsl:template match="retail:advanceShippingNoticeItem">
	<retail:expectedSupplierDeliveryItem>
		<xsl:apply-templates select="*" mode="advanceShippingNoticeItem"/>
	</retail:expectedSupplierDeliveryItem>
</xsl:template>

<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:advanceShippingNoticeItem elements **************************************** -->
	
<xsl:template match="retail:lineNumber" mode="advanceShippingNoticeItem"> 
	<retail:lineNumber><xsl:value-of select="."/></retail:lineNumber>
</xsl:template>
	
<xsl:template match="retail:advanceShippingNoticeId" mode="advanceShippingNoticeItem"> 
	<retail:deliveryId><xsl:value-of select="."/></retail:deliveryId>
</xsl:template>
	
<xsl:template match="retail:destinationInventoryLocationId" mode="advanceShippingNoticeItem"> 
	<xsl:apply-templates select="*" mode="inventoryLocationKey"></xsl:apply-templates>
</xsl:template>
	
<xsl:template match="retail:productId" mode="advanceShippingNoticeItem"> 
	<retail:productId><xsl:value-of select="."/></retail:productId>
</xsl:template>
	
<xsl:template match="retail:supplierProductId" mode="advanceShippingNoticeItem"> 
	<retail:supplierProductId><xsl:value-of select="."/></retail:supplierProductId>
</xsl:template>
	
<xsl:template match="retail:dispatchedQty" mode="advanceShippingNoticeItem"> 
	<retail:expectedQuantity><xsl:value-of select="."/></retail:expectedQuantity>
</xsl:template>
	
<xsl:template match="retail:voided" mode="advanceShippingNoticeItem"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="advanceShippingNoticeItem"> 
	<retail:createdDate><xsl:value-of select="."/></retail:createdDate>
</xsl:template>
	
	
 <!-- Warn unhandled advanceShippingNoticeItem tags -->
<xsl:template match="@*|*" mode="advanceShippingNoticeItem" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled SaleTransaction element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

	
</xsl:stylesheet>