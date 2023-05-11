<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://www.fu.gov.si/"
xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns="http://www.fu.gov.si/"  >
<xsl:strip-space elements="InvoiceRequest" />
<xsl:output indent="no"/>
 <!-- Replace all Attributes and child elements with ns:* prefix with local name -->
<xsl:template match="ns:*">
        <xsl:element name="{local-name()}" >
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>

 </xsl:template>
 <!-- Replace prefix of all Attributes and child elements to ds with Signature URI -->
<xsl:template match="//*[namespace-uri()='http://www.w3.org/2000/09/xmldsig#']">
        <xsl:element name="ds:{local-name()}" >
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>

 </xsl:template>

 <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
 </xsl:template>
 
 <!-- Remove White Spaces -->
 <xsl:template match="text()"><xsl:value-of select="normalize-space(.)"/></xsl:template>

</xsl:stylesheet>