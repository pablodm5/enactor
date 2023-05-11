<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" exclude-result-prefixes="xdt err fn xalan" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core="http://www.enactor.com/core"
	xmlns:crm="http://www.enactor.com/crm" xmlns:xalan="http://xml.apache.org/xslt" xmlns:service="http://www.enactor.com/retail/customerTransaction/service"
	xmlns:mfc="http://www.enactor.com/mfc">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3" />
	<xsl:param name="CustomerNumber"/>
	<xsl:template match="service:customerTransactionSearchResponse">
		<service:listAllResponse>
			<core:pagedArrayList>
				<xsl:for-each select="service:customerTransaction">
					<xsl:call-template name="AddListElement">
						<xsl:with-param name="customerNumber" select="$CustomerNumber" />
						<xsl:with-param name="item" select="." />
					</xsl:call-template>
				</xsl:for-each>
				<core:columnNames>customerKey.customerNumber</core:columnNames>
				<core:columnNames>description</core:columnNames>
				<core:columnNames>transactionKey.applicationId</core:columnNames>
				<core:columnNames>transactionKey.transactionId</core:columnNames>
				<core:columnNames>transactionTypeKey.transactionTypeId</core:columnNames>
				<core:columnNames>locationKey.locationId</core:columnNames>
				<core:columnNames>transactionDate</core:columnNames>
				<core:columnNames>value</core:columnNames>
			</core:pagedArrayList>
		</service:listAllResponse>
	</xsl:template>
	<xsl:template name="AddListElement">
		<xsl:param name="customerNumber" select="string('')" />
		<xsl:param name="item" />
		<core:contents>
			<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:ListElement')" /></xsl:attribute>
			<core:key>
				<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('crm:CustomerTransactionHistoryKey')" /></xsl:attribute>
				<crm:customerId>
					<xsl:value-of select="$customerNumber" />
				</crm:customerId>
				<crm:transactionId>
					<xsl:value-of select="$item/service:transactionRef" />
				</crm:transactionId>
			</core:key>
			<core:data>
				<core:values>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$customerNumber" />
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:description" />
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')" />
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:transactionRef" />
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:transactionType" />
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')" />
					</xsl:call-template>
					<xsl:call-template name="AddDateArrayObject">
						<xsl:with-param name="value" select="$item/service:transactionDate" />
					</xsl:call-template>
					<xsl:call-template name="AddLongArrayObject">
						<xsl:with-param name="value" select="$item/service:total" />
					</xsl:call-template>
				</core:values>
			</core:data>
		</core:contents>
	</xsl:template>

	<xsl:template name="AddStringArrayObject">
		<xsl:param name="value" select="string('')" />
		<core:arrayObject>
			<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')" /></xsl:attribute>
			<core:value>
				<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:string')" /></xsl:attribute>
				<xsl:value-of select="$value" />
			</core:value>
		</core:arrayObject>
	</xsl:template>
	<xsl:template name="AddLongArrayObject">
		<xsl:param name="value" select="string('')" />
		<core:arrayObject>
			<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')" /></xsl:attribute>
			<core:value>
				<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:long')" /></xsl:attribute>
				<xsl:value-of select="$value" />
			</core:value>
		</core:arrayObject>
	</xsl:template>
	<xsl:template name="AddDateArrayObject">
		<xsl:param name="value" select="string('')" />
		<core:arrayObject>
			<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')" /></xsl:attribute>
			<core:value>
				<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:dateTime')" /></xsl:attribute>
				<xsl:value-of select="$value" />
			</core:value>
		</core:arrayObject>
	</xsl:template>
</xsl:stylesheet>
