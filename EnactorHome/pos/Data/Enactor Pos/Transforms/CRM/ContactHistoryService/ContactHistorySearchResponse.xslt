<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" 
	exclude-result-prefixes="xdt err fn xalan" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" 
	xmlns:err="http://www.w3.org/2005/xqt-errors"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:core="http://www.enactor.com/core" 
	xmlns:crm="http://www.enactor.com/crm" 
	xmlns:xalan="http://xml.apache.org/xslt" 
	xmlns:service="http://www.enactor.com/crm/contactHistory/service">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3"/>
	<xsl:template match="service:contactHistorySearchResponse">
		<xsl:param name="customerNumber" select="service:customerNumber"></xsl:param>
		<service:listAllResponse>
			<core:pagedArrayList>
				<xsl:for-each select="service:contactHistoryItem">
					<xsl:call-template name="AddListElement">
						<xsl:with-param name="customerNumber" select="$customerNumber"/>
						<xsl:with-param name="item" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<core:columnNames>customerKey.customerNumber</core:columnNames>
				<core:columnNames>contactTypeKey.contactTypeId</core:columnNames>
				<core:columnNames>contactDate</core:columnNames>
				<core:columnNames>contactHistoryId</core:columnNames>
				<core:columnNames>taskId</core:columnNames>
				<core:columnNames>subject</core:columnNames>
				<core:columnNames>description</core:columnNames>
			</core:pagedArrayList>
		</service:listAllResponse>	
	</xsl:template>
	<xsl:template name="AddListElement">
		<xsl:param name="customerNumber"/>
		<xsl:param name="item"/>		
		<core:contents>
			<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:ListElement')"/></xsl:attribute>
			<core:key>
				<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('crm:CustomerContactHistoryKey')"/></xsl:attribute>
				<xsl:value-of select="$item/service:contactRef"/>
			</core:key>
			<core:data>
				<core:values>									
					<core:arrayObject>
						<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')"/></xsl:attribute>
						<core:value>
							<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:string')"/></xsl:attribute>
							<xsl:value-of select="$customerNumber"/>					
						</core:value>
					</core:arrayObject>
					<core:arrayObject>
						<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')"/></xsl:attribute>
						<core:value>
							<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:string')"/></xsl:attribute>
							<xsl:value-of select="$item/service:typeId"/>					
						</core:value>
					</core:arrayObject>
					<core:arrayObject>
						<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')"/></xsl:attribute>
						<core:value>
							<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:dateTime')"/></xsl:attribute>
							<xsl:value-of select="$item/service:contactDate"/>					
						</core:value>
					</core:arrayObject>
					<core:arrayObject>
						<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')"/></xsl:attribute>
						<core:value>
							<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:string')"/></xsl:attribute>
							<xsl:value-of select="$item/service:contactRef"/>					
						</core:value>
					</core:arrayObject>
					<core:arrayObject>
						<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')"/></xsl:attribute>
						<core:value>
							<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:string')"/></xsl:attribute>
						</core:value>
					</core:arrayObject>
					<core:arrayObject>
						<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')"/></xsl:attribute>
						<core:value>
							<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:string')"/></xsl:attribute>
							<xsl:value-of select="$item/service:subject"/>					
						</core:value>
					</core:arrayObject>
					<core:arrayObject>
						<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')"/></xsl:attribute>
						<core:value>
							<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:string')"/></xsl:attribute>
							<xsl:value-of select="$item/service:description"/>					
						</core:value>
					</core:arrayObject>
				</core:values>
			</core:data>
		</core:contents>
	</xsl:template>
</xsl:stylesheet>
