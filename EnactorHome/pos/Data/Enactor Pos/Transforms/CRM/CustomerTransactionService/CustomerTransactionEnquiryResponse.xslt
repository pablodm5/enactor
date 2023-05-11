<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" exclude-result-prefixes="xdt err fn xalan" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core="http://www.enactor.com/core"
	xmlns:crm="http://www.enactor.com/crm" xmlns:xalan="http://xml.apache.org/xslt" xmlns:service="http://www.enactor.com/retail/customerTransaction/service"
	xmlns:mfc="http://www.enactor.com/mfc">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3" />
	<xsl:param name="CustomerNumber" />
	<xsl:template match="service:customerTransactionEnquiryResponse">
		<xsl:param name="transactionRef" select="service:transactionRef" />
		<service:listAllResponse>
			<core:pagedArrayList>
				<xsl:for-each select="service:transactionLineItem">
					<xsl:call-template name="AddListElement">
						<xsl:with-param name="transactionRef" select="$transactionRef"></xsl:with-param>
						<xsl:with-param name="item" select="." />
					</xsl:call-template>
				</xsl:for-each>
				<core:columnNames>lineNumber</core:columnNames>
				<core:columnNames>productKey.productId</core:columnNames>
				<core:columnNames>description</core:columnNames>
				<core:columnNames>effectiveNetValue</core:columnNames>
				<core:columnNames>quantity</core:columnNames>
				<core:columnNames>salespersonKey.userId</core:columnNames>
				<core:columnNames>salespersonDisplayName</core:columnNames>
			</core:pagedArrayList>
		</service:listAllResponse>
	</xsl:template>
	<xsl:template name="AddListElement">
		<xsl:param name="transactionRef" />
		<xsl:param name="item" />
		<core:contents>
			<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:ListElement')" /></xsl:attribute>
			<core:key>
				<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('crm:CustomerTransactionHistoryItemKey')" /></xsl:attribute>
				<xsl:attribute name="lineNumber"><xsl:value-of select="string('')" /></xsl:attribute>
				<crm:transactionId>
					<xsl:attribute name="applicationId"><xsl:value-of select="string('')" /></xsl:attribute>
					<xsl:value-of select="$transactionRef" />
				</crm:transactionId>
			</core:key>
			<core:data>
				<core:values>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="string('')" />
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:productId" />
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:description" />
					</xsl:call-template>
					<xsl:call-template name="AddLongArrayObject">
						<xsl:with-param name="value" select="$item/service:effectiveNetValue" />
					</xsl:call-template>
					<xsl:call-template name="AddFloatArrayObject">
						<xsl:with-param name="value" select="$item/service:quantity" />
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:salespersonId" />
					</xsl:call-template>
					<xsl:call-template name="AddStringArrayObject">
						<xsl:with-param name="value" select="$item/service:salespersonDisplayName" />
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
	<xsl:template name="AddFloatArrayObject">
		<xsl:param name="value" select="string('')" />
		<core:arrayObject>
			<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('core:WrappedPrimitive')" /></xsl:attribute>
			<core:value>
				<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance"><xsl:value-of select="string('xsd:float')" /></xsl:attribute>
				<xsl:value-of select="$value" />
			</core:value>
		</core:arrayObject>
	</xsl:template>
</xsl:stylesheet>
