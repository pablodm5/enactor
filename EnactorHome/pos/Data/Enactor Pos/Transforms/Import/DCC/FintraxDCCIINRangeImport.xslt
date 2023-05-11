<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xalan="http://xml.apache.org/xslt"     
	xmlns:exslt="http://exslt.org/common"
	xmlns:java="http://xml.apache.org/xalan/java"
	
	xmlns:retail="http://www.enactor.com/retail"
	xmlns:core="http://www.enactor.com/core"
  				
	exclude-result-prefixes="xsl xsi xalan exslt java ">
	
	<xsl:output method="xml" indent="yes" xalan:indent-amount="3"/>
		
	<xsl:template match="file">
		<core:Batch>
			<xsl:apply-templates select="*" mode="line"/>
		</core:Batch>
	</xsl:template>
			
	<xsl:template match="line" mode="line">
		
		<xsl:variable name="dataline" select="."/>
			<xsl:if test="string-length($dataline) >= 23">
				<!-- Record type -->
				<xsl:if test="starts-with($dataline, 'CRD')">
					
					<!-- Don't import if action is D (delete) or status is B (blocked) -->
					<xsl:variable name="crtAction" select="normalize-space(substring($dataline,10,1))"/>
					<!-- Don't import if status is B -->
					<xsl:variable name="crtStatus" select="normalize-space(substring($dataline,38,1))"/>
					<xsl:if test="($crtAction != 'D') and ($crtStatus != 'B')">					
						<xsl:variable name="rangeStart" select="normalize-space(substring($dataline,11,19))"/>
						<xsl:variable name="rangeEnd" select="normalize-space(substring($dataline,11,19))"/>		
						<xsl:variable name="currencyID" select="normalize-space(substring($dataline,32,3))"/>
						<xsl:variable name="country" select="normalize-space(substring($dataline,35,3))"/>
						<xsl:variable name="crtConvType" select="normalize-space(substring($dataline,39,1))"/>
						<xsl:variable name="crtTaxFree" select="normalize-space(substring($dataline,40,1))"/>
						<xsl:variable name="description" select="concat('DCC Card - ', $currencyID)"/>					
					
						<retail:dccIINRange>
							<retail:rangeStart><xsl:value-of select="$rangeStart" /></retail:rangeStart>
							<retail:rangeEnd><xsl:value-of select="$rangeEnd" /></retail:rangeEnd>
							<retail:description><xsl:value-of select="$description" /></retail:description>
							<retail:currencyId><xsl:value-of select="$currencyID" /></retail:currencyId>
							<retail:countryCode><xsl:value-of select="$country" /></retail:countryCode>
							
							<xsl:choose>
								<xsl:when test="($crtTaxFree = '0')">
									<retail:taxFreeEligibility>false</retail:taxFreeEligibility>
								</xsl:when>
								<xsl:otherwise>
									<retail:taxFreeEligibility>true</retail:taxFreeEligibility>
								</xsl:otherwise>
							</xsl:choose>	
						</retail:dccIINRange>
					</xsl:if>	
					
					<xsl:if test="($crtAction = 'D') or ($crtStatus = 'B')">					
						<xsl:variable name="rangeStart" select="normalize-space(substring($dataline,11,19))"/>
						<xsl:variable name="rangeEnd" select="normalize-space(substring($dataline,11,19))"/>
						
						<core:entityDeleteRequest>
							<core:entityKey xsi:type="retail:DCCIINRangeKey" rangeEnd="{$rangeEnd}" rangeStart="{$rangeStart}"/>
						</core:entityDeleteRequest>
					</xsl:if>	
					
				</xsl:if>	
			</xsl:if>		
	</xsl:template>
</xsl:stylesheet>