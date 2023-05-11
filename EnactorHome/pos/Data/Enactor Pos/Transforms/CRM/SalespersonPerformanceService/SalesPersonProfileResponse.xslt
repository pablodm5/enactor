<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" exclude-result-prefixes="xdt err fn xalan" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors" 
	xmlns:xalan="http://xml.apache.org/xslt" 
	xmlns:core="http://www.enactor.com/core" 
	xmlns:crm="http://www.enactor.com/crm"
	xmlns:blhel="http://schemas.datacontract.org/2004/07/blHarrodsEnactorLib"
	xmlns:service="www.harrods.com/EnactorProfile">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" xalan:indent-amount="3" />
	
	<xsl:template match="service:GetSalesPersonProfileDataResult">
		<crm:getSalespersonPerformanceSummaryResponse xmlns:core="http://www.enactor.com/core" xmlns:sref="http://docs.oasis-open.org/wsbpel/2.0/serviceref" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    		<crm:affiliatedCustomers>
		        <xsl:for-each select="blhel:ProfileCustomers/blhel:ProfileCustomer">
					<crm:affiliatedCustomer>
						<crm:customerNumber><xsl:value-of select="blhel:CustomerID"/></crm:customerNumber>
			            <crm:cardNumber><xsl:value-of select="blhel:CardNumber"/></crm:cardNumber>
			            <crm:title></crm:title>
			            <crm:forename><xsl:value-of select="blhel:ForeName"/></crm:forename>
			            <crm:surname><xsl:value-of select="blhel:SurName"/></crm:surname>
			            <crm:tier><xsl:value-of select="blhel:Tier"/></crm:tier>
			            <crm:spend><xsl:value-of select="blhel:Spend"/></crm:spend>
			            <crm:txCount><xsl:value-of select="blhel:TransactionCount"/></crm:txCount>
					</crm:affiliatedCustomer>
				</xsl:for-each>
		    </crm:affiliatedCustomers>
    		<crm:salesYTD><xsl:value-of select="blhel:YTDReport/blhel:SalesYTD"/></crm:salesYTD>
    		<crm:salesMTD><xsl:value-of select="blhel:YTDReport/blhel:SalesMonthTD"/></crm:salesMTD>
		</crm:getSalespersonPerformanceSummaryResponse>		
	</xsl:template>
	
</xsl:stylesheet>

