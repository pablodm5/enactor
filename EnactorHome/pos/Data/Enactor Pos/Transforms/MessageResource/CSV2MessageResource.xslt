<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:core="http://www.enactor.com/core" xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:retail="http://www.enactor.com/retail" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	 >
	<xsl:output method="xml" indent="yes" xalan:indent-amount="3" encoding="UTF-8"/>

	<!-- Defines the meanings of the different columns -->	
	<xsl:variable name="BASENAME" select="1" />
	<xsl:variable name="LANGUAGE" select="2" />
	<xsl:variable name="COUNTRY" select="3" />
	<xsl:variable name="VARIANT" select="4" />
	<xsl:variable name="MESSAGE_ID" select="5" />
	<xsl:variable name="MESSAGE" select="7" />

	<!-- 
		Root template
	-->
	
	<xsl:key name="basename" match="/file/row" use="column[$BASENAME]"/>
	
	<xsl:template match="file">

		<Batch xmlns:core="http://www.enactor.com/core" xmlns:hta="http://docs.oasis-open.org/ns/bpel4people/ws-humantask/api/200803" xmlns:htd="http://docs.oasis-open.org/ns/bpel4people/ws-humantask/200803" xmlns:htt="http://docs.oasis-open.org/ns/bpel4people/ws-humantask/types/200803" xmlns:ns10="http://www.enactor.com/retail/storedRetailTransaction/service" xmlns:ns11="http://www.enactor.com/addressLookup/service" xmlns:ns12="http://www.enactor.com/crm/customerLoyalty/service" xmlns:ns3="http://www.enactor.com/crm" xmlns:ns8="http://www.enactor.com/orders" xmlns:retail="http://www.enactor.com/retail" xmlns:sref="http://docs.oasis-open.org/wsbpel/2.0/serviceref" xmlns:tools="http://www.enactor.com/tools" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:apply-templates select="row[column[$BASENAME]!='' and (generate-id() = generate-id(key('basename',column[$BASENAME])[1]))]" mode="ChangeBase"/>
		</Batch>
	</xsl:template>

	<xsl:template match="row" mode="ChangeBase">

		<xsl:variable name="CURRENT_BASENAME" select="column[$BASENAME]"/>
		<xsl:variable name="PREVIOUS_INDEX" select="position() - 1"/>

		<core:messageResource>
   		<core:basename><xsl:value-of select="column[$BASENAME]"></xsl:value-of></core:basename>
   		<core:localeKey>
   			<xsl:attribute name="country">
   				<xsl:value-of select="column[$COUNTRY]"></xsl:value-of>
   			</xsl:attribute>
   			<xsl:attribute name="variant">
   				<xsl:value-of select="column[$VARIANT]"></xsl:value-of>
   			</xsl:attribute>
   			<xsl:value-of select="column[$LANGUAGE]"></xsl:value-of>
   		</core:localeKey>
		<xsl:apply-templates select="key('basename',column[$BASENAME])" mode="Items"/>
		</core:messageResource>
	</xsl:template>

	<xsl:template match="row" mode="Items">
		
    		<core:message>
    			<xsl:attribute name="key">
    				<xsl:value-of select="column[$MESSAGE_ID]"></xsl:value-of>
    			</xsl:attribute>
    			<xsl:value-of select="column[$MESSAGE]"></xsl:value-of>
    		</core:message>    		
			    					
	</xsl:template>
</xsl:stylesheet>