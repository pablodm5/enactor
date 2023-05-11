<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor InventoryPickHeader entities to TransferRequestHeader entities -->

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

<xsl:template match="ns:listInventoryContainersResponse">
	<ns:listInventoryContainersResponse>	
		<xsl:apply-templates select="*"/>
	</ns:listInventoryContainersResponse>
</xsl:template>

<xsl:template match="retail:listInventoryContainersResponse">
	<retail:localListInventoryContainersResponse>
		<xsl:apply-templates select="*"/>
	</retail:localListInventoryContainersResponse>
</xsl:template>

<xsl:template match="retail:inventoryContainers">
	<retail:localInventoryContainers>
		<xsl:apply-templates select="*"/>
	</retail:localInventoryContainers>
</xsl:template>

<xsl:template match="retail:inventoryContainer">
	<retail:localInventoryContainer>
		<xsl:apply-templates select="*" mode="inventoryContainer"/>
	</retail:localInventoryContainer>
</xsl:template>
	
<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:inventoryContainer elements **************************************** -->
	
<xsl:template match="retail:inventoryLocationKey" mode="inventoryContainer"> 
	<retail:inventoryLocationKey>
	<xsl:apply-templates select="*" mode="inventoryLocationKey"></xsl:apply-templates>
	</retail:inventoryLocationKey>
</xsl:template>
	
<xsl:template match="retail:locationId" mode="inventoryLocationKey"> 
	<retail:locationId><xsl:value-of select="."/></retail:locationId>
</xsl:template>
	
<xsl:template match="retail:locationAreaId" mode="inventoryLocationKey"> 
	<retail:locationAreaId><xsl:value-of select="."/></retail:locationAreaId>
</xsl:template>
	
<xsl:template match="retail:inventoryContainerId" mode="inventoryLocationKey"> 
	<retail:inventoryContainerId><xsl:value-of select="."/></retail:inventoryContainerId>
</xsl:template>

<xsl:template match="retail:name" mode="inventoryContainer"> 
	<retail:name><xsl:value-of select="."/></retail:name>
</xsl:template>
	
<xsl:template match="retail:type" mode="inventoryContainer"> 
	<retail:type><xsl:value-of select="."/></retail:type>
</xsl:template>

<xsl:template match="retail:locationId" mode="inventoryContainer"> 
	<retail:locationId><xsl:value-of select="."/></retail:locationId>
</xsl:template>

<xsl:template match="retail:locationAreaId" mode="inventoryContainer"> 
	<retail:locationAreaId><xsl:value-of select="."/></retail:locationAreaId>
</xsl:template>

<xsl:template match="retail:inventoryContainerId" mode="inventoryContainer"> 
	<retail:inventoryContainerId><xsl:value-of select="."/></retail:inventoryContainerId>
</xsl:template>
<!-- Warn unhandled inventoryLocationKey tags -->
<xsl:template match="@*|*" mode="inventoryLocationKey" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>
	
 <!-- Warn unhandled inventoryContainer tags -->
<xsl:template match="@*|*" mode="inventoryContainer" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

</xsl:stylesheet>