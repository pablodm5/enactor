<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" 
	exclude-result-prefixes="xdt err fn xalan core crm xsd" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" 
	xmlns:err="http://www.w3.org/2005/xqt-errors" 
	xmlns:core="http://www.enactor.com/core" 
	xmlns:crm="http://www.enactor.com/crm" 
	xmlns:xalan="http://xml.apache.org/xslt" 
	xmlns:service="http://www.enactor.com/retail/customerTransaction/service">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3"/>
	<xsl:param name="UserId"/>
	<xsl:template match="service:listAll">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="core:listCriteria">
		<service:customerTransactionSearch>
		<!-- Add customer number filter -->
		<xsl:call-template name="AddCustomerNumberFilter">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add tx start date filters -->
		<xsl:call-template name="AddTransactionStartDateFilter">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add tx end date filters -->
		<xsl:call-template name="AddTransactionEndDateFilter">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add user id filters -->
		<xsl:call-template name="AddUserIdFilter">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add custom filter1 -->
		<xsl:call-template name="AddCustomFilter1">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add custom filter2 -->
		<xsl:call-template name="AddCustomFilter2">
			<xsl:with-param name="filters" select="core:filters"></xsl:with-param>
		</xsl:call-template>
		<!-- Add (requesting) user id filter -->
		<xsl:if test="$UserId">
			<service:userId><xsl:value-of select="$UserId"/></service:userId>
		</xsl:if>
			<service:maxHits><xsl:value-of select="core:maxRows"/></service:maxHits>
		<xsl:apply-templates  select="core:orderByColumns"/>
		<xsl:if test="count(core:orderByColumns)=0">
			<service:orderBy>transactionDate</service:orderBy>
		</xsl:if>
		</service:customerTransactionSearch>
	</xsl:template>
	<xsl:template name="AddCustomerNumberFilter">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='CustomerNumber'">
					<service:customerNumber><xsl:value-of select="core:supportValues/core:value"/></service:customerNumber>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="AddTransactionStartDateFilter">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='TransactionStartDate' and string(core:supportValues/core:value)!=''">
					<service:fromDate><xsl:value-of select="core:supportValues/core:value"></xsl:value-of></service:fromDate>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="AddTransactionEndDateFilter">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='TransactionEndDate' and string(core:supportValues/core:value)!=''">
					<service:toDate><xsl:value-of select="core:supportValues/core:value"></xsl:value-of></service:toDate>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="AddUserIdFilter">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='TransactionUserId' and string(core:supportValues/core:value)!=''">
					<service:transactionUserId><xsl:value-of select="core:supportValues/core:value"></xsl:value-of></service:transactionUserId>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="AddCustomFilter1">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='CustomFilter1' and string(core:supportValues/core:value)!=''">
					<service:customFilter1><xsl:value-of select="core:supportValues/core:value"></xsl:value-of></service:customFilter1>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="AddCustomFilter2">
		<xsl:param name="filters"></xsl:param>
		<xsl:for-each select="$filters/child::node()">
			<xsl:choose>
				<xsl:when test="string(core:id)='CustomFilter2' and string(core:supportValues/core:value)!=''">
					<service:customFilter2><xsl:value-of select="core:supportValues/core:value"></xsl:value-of></service:customFilter2>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="core:orderByColumns">
		<service:orderBy>
			<xsl:call-template name="getOrderByProperty">
				<xsl:with-param name="columnName">
					<xsl:value-of select="string(core:columnName)"></xsl:value-of>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="getOrderByDirection">
				<xsl:with-param name="sortOrder">
					<xsl:value-of select="string(core:sortOrder)"></xsl:value-of>
				</xsl:with-param>
			</xsl:call-template>
		</service:orderBy>
	</xsl:template>
	
	<xsl:template name="getOrderByProperty">
		<xsl:param name="columnName" select="string('')"></xsl:param>
		<xsl:choose>
			<xsl:when test="$columnName='transactionDate'"><xsl:value-of select="string('transactionDate')"/></xsl:when>
			<xsl:when test="$columnName='value'"><xsl:value-of select="string('total')"/></xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="getOrderByDirection">
		<xsl:param name="sortOrder" select="string('')"></xsl:param>
		<xsl:choose>
			<xsl:when test="$sortOrder='DESCENDING'"><xsl:value-of select="string(' DESC')"/></xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
