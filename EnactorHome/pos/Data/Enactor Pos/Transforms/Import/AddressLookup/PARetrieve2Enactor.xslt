<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:core="http://www.enactor.com/core"	
	xmlns:retail="http://www.enactor.com/retail"
	xmlns:pa="http://services.postcodeanywhere.co.uk/"	
	xmlns="http://www.enactor.com/retail"
	exclude-result-prefixes="pa"	
>
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:template match="pa:Response/pa:Result/pa:Results" >
	<retail:address>
		<retail:addressId><xsl:value-of select="pa:Id"/></retail:addressId>
		<retail:street1><xsl:value-of select="pa:Line1"/></retail:street1>
		<retail:street2><xsl:value-of select="pa:Line2"/></retail:street2>
		<retail:street3><xsl:value-of select="pa:Line3"/></retail:street3>
		<retail:postCode><xsl:value-of select="pa:PostalCode"/></retail:postCode>
		<retail:country><xsl:value-of select="pa:CountryName"/></retail:country>
		<retail:county><xsl:value-of select="pa:Province"/></retail:county>
		<retail:town><xsl:value-of select="pa:City"/></retail:town>
		<retail:countryCodeId><xsl:value-of select="pa:CountryIso3"/></retail:countryCodeId> 
	</retail:address>
	</xsl:template>
</xsl:stylesheet>