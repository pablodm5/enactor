<?xml version="1.0" encoding="UTF-8" ?>

<!--  Enactor locationArea entities to localLocationArea entities -->

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

<xsl:template match="ns:listLocationAreasResponse">
	<ns:listLocationAreasResponse>	
		<xsl:apply-templates select="*"/>
	</ns:listLocationAreasResponse>
</xsl:template>

<xsl:template match="retail:listLocationAreasResponse"> 
	<retail:localListLocationAreasResponse>
		<xsl:apply-templates select="*"/>
	</retail:localListLocationAreasResponse>
</xsl:template>

<xsl:template match="retail:locationAreaList">
 	<retail:localLocationAreasList>
		<xsl:apply-templates select="*"/>
 	</retail:localLocationAreasList>
</xsl:template>

<xsl:template match="retail:locationArea">
	<retail:localLocationArea>
		<xsl:apply-templates select="*" mode="locationArea"/>
	</retail:localLocationArea>
</xsl:template>
	
<!-- Warn unhandled root tags -->
<xsl:template match="@*|*" priority="-1">
	<xsl:comment>WARNING - unhandled root element: <xsl:value-of select="name()"/></xsl:comment>
</xsl:template>
	
<!-- **************************************** retail:locationArea elements **************************************** -->
	
<xsl:template match="retail:groupId" mode="locationArea"> 
	<retail:groupId><xsl:value-of select="."/></retail:groupId>
</xsl:template>
	
<xsl:template match="retail:groupTypeId" mode="locationArea"> 
	<retail:groupTypeId><xsl:value-of select="."/></retail:groupTypeId>
</xsl:template>
	
<xsl:template match="retail:groupHierarchyId" mode="locationArea"> 
	<retail:groupHierarchyId><xsl:value-of select="."/></retail:groupHierarchyId>
</xsl:template>
	
<xsl:template match="retail:level" mode="locationArea"> 
	<retail:level><xsl:value-of select="."/></retail:level>
</xsl:template>
	
<xsl:template match="retail:level1GroupId" mode="locationArea"> 
	<retail:level1GroupId><xsl:value-of select="."/></retail:level1GroupId>
</xsl:template>
	
<xsl:template match="retail:level2GroupId" mode="locationArea"> 
	<retail:level2GroupId><xsl:value-of select="."/></retail:level2GroupId>
</xsl:template>
	
<xsl:template match="retail:level3GroupId" mode="locationArea"> 
	<retail:level3GroupId><xsl:value-of select="."/></retail:level3GroupId>
</xsl:template>
	
<xsl:template match="retail:level4GroupId" mode="locationArea"> 
	<retail:level4GroupId><xsl:value-of select="."/></retail:level4GroupId>
</xsl:template>
	
<xsl:template match="retail:level5GroupId" mode="locationArea"> 
	<retail:level5GroupId><xsl:value-of select="."/></retail:level5GroupId>
</xsl:template>
	
<xsl:template match="retail:level6GroupId" mode="locationArea"> 
	<retail:level6GroupId><xsl:value-of select="."/></retail:level6GroupId>
</xsl:template>
	
<xsl:template match="retail:level7GroupId" mode="locationArea"> 
	<retail:level7GroupId><xsl:value-of select="."/></retail:level7GroupId>
</xsl:template>
	
<xsl:template match="retail:level8GroupId" mode="locationArea"> 
	<retail:level8GroupId><xsl:value-of select="."/></retail:level8GroupId>
</xsl:template>
	
<xsl:template match="retail:level9GroupId" mode="locationArea"> 
	<retail:level9GroupId><xsl:value-of select="."/></retail:level9GroupId>
</xsl:template>
	
<xsl:template match="retail:level10GroupId" mode="locationArea"> 
	<retail:level10GroupId><xsl:value-of select="."/></retail:level10GroupId>
</xsl:template>

<xsl:template match="retail:name" mode="locationArea"> 
	<retail:name><xsl:value-of select="."/></retail:name>
</xsl:template>
	
<xsl:template match="retail:variantGroupId" mode="locationArea"> 
	<retail:variantGroupId><xsl:value-of select="."/></retail:variantGroupId>
</xsl:template>
	
<xsl:template match="retail:variantGroupTypeId" mode="locationArea"> 
	<retail:variantGroupTypeId><xsl:value-of select="."/></retail:variantGroupTypeId>
</xsl:template>
	
<xsl:template match="retail:variantGroupHierarchyId" mode="locationArea"> 
	<retail:variantGroupHierarchyId><xsl:value-of select="."/></retail:variantGroupHierarchyId>
</xsl:template>
	
<xsl:template match="retail:variantLevel" mode="locationArea"> 
	<retail:variantLevel><xsl:value-of select="."/></retail:variantLevel>
</xsl:template>

<xsl:template match="retail:lastUpdated" mode="locationArea"> 
	<retail:lastUpdated><xsl:value-of select="."/></retail:lastUpdated>
</xsl:template>
	
<!-- Warn unhandled locationArea tags -->
<xsl:template match="@*|*" mode="locationArea" priority="-1">
	<!-- <xsl:comment>WARNING - unhandled SaleTransaction element: <xsl:value-of select="name()"/></xsl:comment> -->
</xsl:template>

	
</xsl:stylesheet>