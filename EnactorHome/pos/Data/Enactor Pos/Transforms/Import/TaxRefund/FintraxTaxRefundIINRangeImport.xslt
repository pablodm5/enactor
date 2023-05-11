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
		<xsl:if test="string-length($dataline) >= 5">
			<!-- Ignore Title Record and trailer record-->
			<xsl:if test="not(starts-with($dataline, 'BRT')) and not (starts-with($dataline, 'EOF'))">
			
					<!--  <xsl:variable name="lineItems" select="fn:getTokens($dataline)" as="xs:string+" />
							
					<xsl:variable name="rangeStart" select="$lineItems[1]"/>
					<xsl:variable name="rangeEnd" select="$lineItems[1]"/>
					<xsl:variable name="currencyID" select="$lineItems[2]"/>
					<xsl:variable name="crtTaxFree" select="$lineItems[3]"/>
					<xsl:variable name="description" select="concat('Tax Refund Range - ', $currencyID)"/>		-->			
				
					<xsl:variable name="crtTaxFree">
						<xsl:call-template name="getFieldByIndex">
				                <xsl:with-param name="index" select="2"/>
				                <xsl:with-param name="line" select="$dataline"/>
           				</xsl:call-template>
           			</xsl:variable>
					<xsl:variable name="countryCode">
						<xsl:call-template name="getFieldByIndex">
				                <xsl:with-param name="index" select="1"/>
				                <xsl:with-param name="line" select="$dataline"/>
           				</xsl:call-template>
           			</xsl:variable>
						
					<retail:taxRefundIINRange>
						<retail:rangeStart>
							<xsl:call-template name="getFieldByIndex">
				                <xsl:with-param name="index" select="0"/>
				                <xsl:with-param name="line" select="$dataline"/>
           					</xsl:call-template>
					</retail:rangeStart>
					<retail:rangeEnd>
						<xsl:call-template name="getFieldByIndex">
				                <xsl:with-param name="index" select="0"/>
				                <xsl:with-param name="line" select="$dataline"/>
           					</xsl:call-template>
					</retail:rangeEnd>
					<retail:description> <xsl:value-of select="concat('TaxFree - ', $countryCode)"/></retail:description>
					<retail:countryCode> <xsl:value-of select="normalize-space($countryCode)"/></retail:countryCode>
						
					<xsl:choose>
						<xsl:when test="($crtTaxFree = '0')">
							<retail:taxFreeEligibility>false</retail:taxFreeEligibility>
						</xsl:when>
						<xsl:otherwise>
							<retail:taxFreeEligibility>true</retail:taxFreeEligibility>
						</xsl:otherwise>
					</xsl:choose>	
				</retail:taxRefundIINRange>
							
			</xsl:if>	
		</xsl:if>		
	</xsl:template>
		
	<xsl:template name="getFieldByIndex">
	    <xsl:param name="index"/>
	    <xsl:param name="line"/>
	    <xsl:choose>
	        <xsl:when test="$index > 0">
	            <xsl:call-template name="getFieldByIndex">
	                <xsl:with-param name="index" select="$index -1"/>
	                <xsl:with-param name="line" select="substring-after($line, ',')"/>
	            </xsl:call-template>
	        </xsl:when>
	        <xsl:otherwise>
	            <xsl:value-of select="substring-before($line,',')"/>
	        </xsl:otherwise>
	    </xsl:choose>
	</xsl:template>

</xsl:stylesheet>