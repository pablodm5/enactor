<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:core="http://www.enactor.com/core"
	xmlns:retail="http://www.enactor.com/retail" xmlns="PostcodeAnywhere"
	exclude-result-prefixes="core retail">


	<xsl:param name="LICENCE_KEY" select="'No access key was provided to the service'" />
	<xsl:param name="ADDRESS_ID" />
	<xsl:param name="LANGUAGE_PREFERENCE" select="'EN'" />

	<xsl:output method="xml" encoding="UTF-8" indent="yes" />

	<xsl:template match="retail:addressListItem">
		<xsl:variable name="addressId">
			<xsl:choose>
				<xsl:when test="retail:addressId">
					<xsl:value-of select="retail:addressId" />
				</xsl:when>
				<xsl:when test="$ADDRESS_ID">
					<xsl:value-of select="$ADDRESS_ID" />
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="languagePreference">
			<xsl:choose>
				<xsl:when test="retail:languagePreference">
					<xsl:value-of select="retail:languagePreference" />
				</xsl:when>
				<xsl:when test="$LANGUAGE_PREFERENCE">
					<xsl:value-of select="$LANGUAGE_PREFERENCE" />
				</xsl:when>
			</xsl:choose>
		</xsl:variable>


		<Retrieve>
			<Key>
				<xsl:value-of select="$LICENCE_KEY" />
			</Key>
			<Id>
				<xsl:value-of select="$addressId" />
			</Id>
			<LanguagePreference>
				<xsl:value-of select="$languagePreference" />
			</LanguagePreference>

		</Retrieve>
	</xsl:template>


</xsl:stylesheet>