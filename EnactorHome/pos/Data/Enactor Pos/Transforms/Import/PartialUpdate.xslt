<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xalan="http://xml.apache.org/xslt" xmlns:exslt="http://exslt.org/common"

	xmlns:mfc="http://www.enactor.com/retail" xmlns:core="http://www.enactor.com/core"
	xmlns:config="xalan://com.enactor.core.utilities.PropertyRegistry"

	exclude-result-prefixes="xsl xsi xalan exslt config core">

	<xsl:output method="xml" indent="yes" xalan:indent-amount="3" />

	<xsl:include href="enactor:Import/PartialUpdateTemplate.xslt" />


	<xsl:template match="Batch">

		<xsl:choose>
			<xsl:when test="@partialUpdate='true'">
				<Batch>
					<xsl:for-each select="/*">
						<xsl:apply-templates select="node()|@*" />
					</xsl:for-each>
				</Batch>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="." />
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template match="node()|@*">
		<xsl:copy>
			<xsl:call-template name="PartialUpdate">
				<xsl:with-param name="delta" select="." />
			</xsl:call-template>
		</xsl:copy>
	</xsl:template>


</xsl:stylesheet>