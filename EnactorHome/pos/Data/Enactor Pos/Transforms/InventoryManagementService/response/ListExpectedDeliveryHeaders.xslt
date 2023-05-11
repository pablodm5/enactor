<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor ExpectedDeliveryHeader entities to ExpectedDeliveryHeader entities -->

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

<xsl:template match="ns:listExpectedDeliveryHeadersResponse">
	<ns:listExpectedDeliveryHeadersResponse>
		<xsl:apply-templates select="*"/>
	</ns:listExpectedDeliveryHeadersResponse>
</xsl:template>

<xsl:template match="retail:listExpectedDeliveryHeadersResponse">
	<retail:localListExpectedDeliveryHeadersResponse>
		<xsl:apply-templates select="*"/>
	</retail:localListExpectedDeliveryHeadersResponse>
</xsl:template>

<xsl:template match="retail:expectedDeliveryHeadersList">
	<retail:expectedDeliveryHeadersList>
		<xsl:apply-templates select="*" mode="expectedDeliveryHeader"/>
	</retail:expectedDeliveryHeadersList>
</xsl:template>

<xsl:template match="retail:expectedDeliveryHeader" mode="expectedDeliveryHeader">
	<retail:expectedDeliveryHeader>
		<xsl:apply-templates select="*" mode="expectedDeliveryHeader"/>
	</retail:expectedDeliveryHeader>
</xsl:template>

<xsl:template match="retail:advanceShippingNoticeHeaderListElement" mode="expectedDeliveryHeader">
	<retail:expectedSupplierDeliveryHeader>
		<xsl:apply-templates select="*" mode="expectedDeliveryHeader"/>
	</retail:expectedSupplierDeliveryHeader>
</xsl:template>

<xsl:template match="retail:inventoryDispatchHeaderListElement" mode="expectedDeliveryHeader">
	<retail:expectedTransferHeader>
		<xsl:apply-templates select="*" mode="expectedDeliveryHeader"/>
	</retail:expectedTransferHeader>
</xsl:template>

<xsl:template match="retail:customerInventoryDispatchHeaderListElement" mode="expectedDeliveryHeader">
	<retail:customerExpectedTransferHeader>
		<xsl:apply-templates select="*" mode="expectedDeliveryHeader"/>
	</retail:customerExpectedTransferHeader>
</xsl:template>

<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:expectedDeliveryHeader elements **************************************** -->
	
<xsl:template match="retail:authorisedByUserId" mode="expectedDeliveryHeader"> 
	<retail:authorisedByUserId><xsl:value-of select="."/></retail:authorisedByUserId>
</xsl:template>
	
<xsl:template match="retail:createdByUserKey" mode="expectedDeliveryHeader"> 
	<retail:createdByUserId><xsl:value-of select="."/></retail:createdByUserId>
</xsl:template>
	
<xsl:template match="retail:distributionOrderKey" mode="expectedDeliveryHeader"> 
	<xsl:apply-templates select="retail:distributionOrderId" mode="distributionOrderKey"/>
</xsl:template>

<xsl:template match="retail:distributionOrderId" mode="expectedDeliveryHeader"> 
	<retail:distributionOrderId><xsl:value-of select="."/></retail:distributionOrderId>
</xsl:template>
	
<xsl:template match="retail:totalDispatchedCartons" mode="expectedDeliveryHeader"> 
	<retail:totalDispatchedCartons><xsl:value-of select="."/></retail:totalDispatchedCartons>
</xsl:template>

<xsl:template match="retail:totalReceivedCartons" mode="expectedDeliveryHeader"> 
	<retail:totalReceivedCartons><xsl:value-of select="."/></retail:totalReceivedCartons>
</xsl:template>

<xsl:template match="retail:totalDispatchedQty" mode="expectedDeliveryHeader"> 
	<retail:totalDispatchedQty><xsl:value-of select="."/></retail:totalDispatchedQty>
</xsl:template>

<xsl:template match="retail:supplierId" mode="expectedDeliveryHeader"> 
	<retail:supplierId><xsl:value-of select="."/></retail:supplierId>
</xsl:template>

<xsl:template match="retail:purchaseOrderId" mode="expectedDeliveryHeader"> 
	<retail:purchaseOrderId><xsl:value-of select="."/></retail:purchaseOrderId>
</xsl:template>

<xsl:template match="retail:advanceShippingNoticeId" mode="expectedDeliveryHeader"> 
	<retail:deliveryId><xsl:value-of select="."/></retail:deliveryId>
</xsl:template>

<xsl:template match="retail:inventoryDispatchId" mode="expectedDeliveryHeader"> 
	<retail:deliveryId><xsl:value-of select="."/></retail:deliveryId>
</xsl:template>

<xsl:template match="retail:expectedDeliveryId" mode="expectedDeliveryHeader"> 
	<retail:deliveryId><xsl:value-of select="."/></retail:deliveryId>
</xsl:template>
	
<xsl:template match="retail:sourceLocationId" mode="expectedDeliveryHeader"> 
	<retail:sourceLocationId><xsl:value-of select="."/></retail:sourceLocationId>
</xsl:template>
	
<xsl:template match="retail:createdDate" mode="expectedDeliveryHeader"> 
	<retail:dateTimeCreated><xsl:value-of select="."/></retail:dateTimeCreated>
</xsl:template>
	
<xsl:template match="retail:dispatchedDate" mode="expectedDeliveryHeader"> 
	<retail:dateTimeDispatched><xsl:value-of select="."/></retail:dateTimeDispatched>
	<retail:dateTimeExpected><xsl:value-of select="."/></retail:dateTimeExpected>
</xsl:template>
	
<xsl:template match="retail:destinationLocationId" mode="expectedDeliveryHeader"> 
	<retail:destinationLocationId><xsl:value-of select="."/></retail:destinationLocationId>
</xsl:template>
	
<xsl:template match="retail:createdAtLocationId" mode="expectedDeliveryHeader"> 
	<retail:createdAtLocationId><xsl:value-of select="."/></retail:createdAtLocationId>
</xsl:template>
	
<xsl:template match="retail:status" mode="expectedDeliveryHeader"> 
	<retail:status><xsl:value-of select="."/></retail:status>
</xsl:template>
	
<xsl:template match="retail:dispatchStatus" mode="expectedDeliveryHeader"> 
	<retail:dispatchStatus><xsl:value-of select="."/></retail:dispatchStatus>
</xsl:template>
	
<xsl:template match="retail:createdByUserId" mode="expectedDeliveryHeader"> 
	<retail:createdByUserId><xsl:value-of select="."/></retail:createdByUserId>
</xsl:template>
	
<xsl:template match="retail:voided" mode="expectedDeliveryHeader"> 
	<retail:voided><xsl:value-of select="."/></retail:voided>
</xsl:template>
	
<xsl:template match="retail:currencyId" mode="expectedDeliveryHeader"> 
	<retail:currency><xsl:value-of select="."/></retail:currency>
</xsl:template>

<xsl:template match="retail:totalDispatchedUnits" mode="expectedDeliveryHeader"> 
	<retail:totalDispatchedUnits><xsl:value-of select="."/></retail:totalDispatchedUnits>
</xsl:template>

<xsl:template match="retail:customerOrderId" mode="expectedDeliveryHeader"> 
	<retail:customerOrderId><xsl:value-of select="."/></retail:customerOrderId>
</xsl:template>

<xsl:template match="retail:customerNumber" mode="expectedDeliveryHeader"> 
	<retail:customerNumber><xsl:value-of select="."/></retail:customerNumber>
</xsl:template>

<xsl:template match="retail:reason" mode="expectedDeliveryHeader"> 
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

<xsl:template match="retail:inventoryDispatchAddresses" mode="expectedDeliveryHeader">
	<retail:expectedTransferAddresses>
		<xsl:apply-templates select="." mode="expectedTransferAddresses"/>
	</retail:expectedTransferAddresses>
</xsl:template>

<xsl:template match="retail:inventoryDispatchAddress" mode="expectedTransferAddresses">
	<retail:expectedTransferAddress>
		<xsl:apply-templates select="." mode="expectedTransferAddress"/>
	</retail:expectedTransferAddress>
</xsl:template>

<xsl:template match="retail:name" mode="expectedTransferAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:address" mode="expectedTransferAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:contactTypeId" mode="expectedTransferAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="retail:voided" mode="expectedTransferAddress"> 
	<xsl:copy-of select="."/>
</xsl:template>
	
	
 <!-- Warn unhandled expectedDeliveryHeader tags -->
<xsl:template match="@*|*" mode="expectedDeliveryHeader" priority="-1">
	<xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
<xsl:template match="@*|*" mode="distributionOrderKey" priority="-1">
	<xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
</xsl:stylesheet>