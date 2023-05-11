<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:exslt="http://exslt.org/common"
	xmlns:dyn="http://exslt.org/dynamic"
	xmlns:str="http://exslt.org/strings"

	xmlns:retail="http://www.enactor.com/retail"
	xmlns:core="http://www.enactor.com/core"
  	xmlns:config="xalan://com.enactor.core.utilities.PropertyRegistry"
  	xmlns:xsltUtils="xalan://com.enactor.retailProcessing.transform.XSLTUtils"
	xmlns:java="http://xml.apache.org/xalan/java"
  	extension-element-prefixes="config xsltUtils exslt"
	exclude-result-prefixes="xsl xsi xalan exslt config">

<xsl:output method="xml" indent="yes" xalan:indent-amount="3"/>


<xsl:template name="PartialUpdate">
	<xsl:param name="delta"/>
	<!-- Optional Parameter. Fail the partial update if the loaded entity does not exist -->
	<xsl:param name="failIfEntityDoesNotExist" select="false()"/>
	<!-- Optional Parameter. Provided the loaded entity instead of loading here -->
	<xsl:param name="loadedEntity"/>

	<xsl:variable name="loaded">
		<xsl:choose>
			<xsl:when test="$loadedEntity">
				<xsl:copy-of select="$loadedEntity"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="xsltUtils:loadEntityLenient($delta)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:choose>
		<xsl:when test="$loaded = '' and $failIfEntityDoesNotExist">
			<xsl:message terminate="yes">Partial Update could not load entity from database.</xsl:message>
		</xsl:when>
		<xsl:otherwise>
			<xsl:variable name="deltaNode" select="exslt:node-set($delta)"/>

			<xsl:apply-templates select="$deltaNode" mode="PartialUpdate">
				<xsl:with-param name="loadedEntity" select="exslt:node-set($loaded)/*"/>
			</xsl:apply-templates>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="*" mode="PartialUpdate">
	<xsl:param name="loadedEntity"/>
	<xsl:variable name="deltaEntity" select="."/>
	<xsl:variable name="uniques" select="xsltUtils:getUniqueNodeList($deltaEntity, $loadedEntity)"/>

	<xsl:for-each select="$uniques/*/*">
		<xsl:variable name="elementName" select="." />
		<xsl:choose>
			<xsl:when test="not($deltaEntity/*[local-name() = $elementName])">
				<!-- If there's nothing on the deltaEntity part, simply copy the loadedEntity part -->
				<xsl:copy-of select="$loadedEntity/*[local-name() = $elementName]" />
			</xsl:when>
			<xsl:when test="not($loadedEntity/*[local-name() = $elementName])">
				<!-- If there's nothing on the loadedEntity part, simply copy the deltaEntity part -->
				<xsl:copy-of select="$deltaEntity/*[local-name() = $elementName]" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<!-- Children Node -->
					<xsl:when test="$loadedEntity/*[local-name() = $elementName]/*">
						<xsl:apply-templates select="$deltaEntity/*[local-name() = $elementName]" mode="PartialUpdateMerge">
							<xsl:with-param name="loadedEntity" select="$loadedEntity/*[local-name() = $elementName]" />
						</xsl:apply-templates>
					</xsl:when>

					<!-- Simple Node -->
					<xsl:otherwise>
						<xsl:apply-templates select="$deltaEntity/*[local-name() = $elementName]" mode="PartialUpdateOverride">
							<xsl:with-param name="loadedEntity" select="$loadedEntity/*[local-name() = $elementName]" />
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
</xsl:template>


<xsl:template match="*" mode="PartialUpdateMerge">
	<xsl:param name="loadedEntity"/>
	<!-- Merge two nodes with children -->
	<xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:call-template name="PartialUpdate">
			<xsl:with-param name="delta" select="."/>
			<xsl:with-param name="loadedEntity" select="$loadedEntity"/>
			<xsl:with-param name="failIfEntityDoesNotExist" select="false()"/>
		</xsl:call-template>
	</xsl:copy>
</xsl:template>

<xsl:template match="*" mode="PartialUpdateOverride">
	<xsl:param name="loadedEntity"/>
	<xsl:variable name="deltaEntity" select="."/>
	<!-- Override a node -->
	<xsl:copy-of select="$deltaEntity" />
</xsl:template>

</xsl:stylesheet>
