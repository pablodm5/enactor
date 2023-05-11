<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" exclude-result-prefixes="xdt err fn xalan" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core="http://www.enactor.com/core"
	xmlns:xalan="http://xml.apache.org/xslt" xmlns:service="http://www.enactor.com/retail/product/service"
	xmlns:mfc="http://www.enactor.com/mfc">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3" />
	<xsl:template match="service:productSearchResponse">
		<xsl:param name="customerNumber" select="service:customerNumber"></xsl:param>
		<service:listAllResponse>
			<core:pagedArrayList>
				<xsl:for-each select="service:productListItem">
					<xsl:call-template name="AddListElement">
						<xsl:with-param name="item" select="." />
					</xsl:call-template>
				</xsl:for-each>
				<core:columnNames>productId</core:columnNames>
				<core:columnNames>type</core:columnNames>
				<core:columnNames>regionKey.groupId</core:columnNames>
				<core:columnNames>regionKey.groupTypeId</core:columnNames>
				<core:columnNames>regionKey.groupHierarchyId</core:columnNames>
				<core:columnNames>productDescription</core:columnNames>
				<core:columnNames>templateKey.templateId</core:columnNames>
				<core:columnNames>fasciaKey.groupId</core:columnNames>
				<core:columnNames>fasciaKey.groupHierarchyId</core:columnNames>
				<core:columnNames>brandKey.groupId</core:columnNames>
				<core:columnNames>brandKey.groupHierarchyId</core:columnNames>
				<core:columnNames>mmGroupKey.groupId</core:columnNames>
				<core:columnNames>mmGroupKey.groupHierarchyId</core:columnNames>
				<core:columnNames>rangeKey.groupId</core:columnNames>
				<core:columnNames>rangeKey.groupHierarchyId</core:columnNames>
				<core:columnNames>supplierDescription</core:columnNames>
			</core:pagedArrayList>
		</service:listAllResponse>
	</xsl:template>
	<xsl:template name="AddListElement">
		<xsl:param name="customerNumber" />
		<xsl:param name="item" />
		<core:contents>
			<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:ListElement')" /></xsl:attribute>
			<core:key>
				<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('mfc:ProductKey')" /></xsl:attribute>
				<xsl:value-of select="$item/service:productId" />
			</core:key>
			<core:data>
				<core:values>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:productId"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('All')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('region')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('All')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:description"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')"/>
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:styleDescription"/>
					</xsl:call-template>
				</core:values>
			</core:data>
		</core:contents>
	</xsl:template>
	
	<xsl:template name="AddStringArrayObject">
		<xsl:param name="value" select="string('')"/>
		<core:arrayObject>
			<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')" /></xsl:attribute>
			<core:value>
				<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:string')" /></xsl:attribute>
				<xsl:value-of select="$value" />
			</core:value>
		</core:arrayObject>
	</xsl:template>
</xsl:stylesheet>
