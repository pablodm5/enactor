<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:core="http://www.enactor.com/core"	
	xmlns:retail="http://www.enactor.com/retail"	
	xmlns="http://services.postcodeanywhere.co.uk/"
	exclude-result-prefixes="core retail"	
>
 
 	<xsl:param name="POSTCODE"/>
 	<xsl:param name="LICENCE_KEY"/>
 	<xsl:param name="MAX_RESULTS"/>
 	<xsl:param name="LANG_PREF" select="'EN'"/>
 	<xsl:param name="SEARCH_FILTER"/>
 	
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	
	<xsl:template match="retail:address">
	<xsl:variable name="searchString">
		<xsl:choose>
		    <xsl:when test="retail:street1 and retail:postCode">
		    	<xsl:value-of select="retail:street1"/>
		    	<xsl:text>, </xsl:text>
				<xsl:value-of select="retail:postCode"/>
			</xsl:when>
			<xsl:when test="retail:postCode">
				<xsl:value-of select="retail:postCode"/>
			</xsl:when>
			<xsl:when test="retail:street1 and retail:town">
				<xsl:value-of select="retail:town"/>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="retail:street1"/>
			</xsl:when>
			<xsl:when test="retail:town">
				<xsl:value-of select="retail:town"/>
			</xsl:when>
			<xsl:when test="retail:street1">
				<xsl:value-of select="retail:street1"/>
			</xsl:when>
			<xsl:when test="$POSTCODE">
				<xsl:value-of select="$POSTCODE"/>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EFFECTIVE_MAX_RESULTS">
	<xsl:value-of select="string(number($MAX_RESULTS) +1)"/>
	</xsl:variable>
	<xsl:variable name="COUNTRY_CODE">
      <xsl:choose>
      <xsl:when test="retail:countryCodeId">
      <xsl:value-of select="retail:countryCodeId"/>
      </xsl:when>
      <xsl:otherwise>GBR</xsl:otherwise>
     </xsl:choose>
    </xsl:variable>
    <xsl:variable name="lastId">
      <xsl:choose>
      <xsl:when test="retail:referenceId">
      <xsl:value-of select="retail:referenceId"/>
      </xsl:when>
     </xsl:choose>
    </xsl:variable>

<Find>
		
	<Key><xsl:value-of select="$LICENCE_KEY"/></Key> 
	<SearchTerm><xsl:value-of select="$searchString"/></SearchTerm>
	<LastId><xsl:value-of select="$lastId"/></LastId>
	<SearchFor><xsl:value-of select="$SEARCH_FILTER"/></SearchFor>
	<Country><xsl:value-of select="$COUNTRY_CODE"/></Country> 
	<LanguagePreference><xsl:value-of select="$LANG_PREF"/></LanguagePreference>
	<MaxSuggestions>20</MaxSuggestions>
	<MaxResults><xsl:value-of select="$EFFECTIVE_MAX_RESULTS"/></MaxResults>
</Find>
	</xsl:template>
	
	
</xsl:stylesheet>