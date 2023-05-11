<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xalan="http://xml.apache.org/xalan"
	
	xmlns:core="http://www.enactor.com/core"
	xmlns:orders="http://www.enactor.com/orders"
	xmlns:retail="http://www.enactor.com/retail"
	xmlns:service="http://www.enactor.com/orders/CustomerOrdersService"
	
	xmlns:enactor="com.enactor.commonUI.transforms.XalanExtensions"
	
	extension-element-prefixes="enactor"
	exclude-result-prefixes="xsl xalan">
	
	<!-- Match the document element -->
	<xsl:template match="service:*">
		<xsl:copy>
			<xsl:for-each select="*">
				<enactor:copy name="retail:{local-name()}" namespace="http://www.enactor.com/retail">
					<xsl:apply-templates/>
				</enactor:copy>
			</xsl:for-each>			 
		</xsl:copy>
	</xsl:template>
	
	<!-- Matching the top level element directly and output the tag manually. -->
	<!-- The namespaces declared at the top are added to the output automatically. -->
	<!-- Note. 'element' will only allow one namespace. -->
	<xsl:template match="orders:orderPaymentTransaction">
		<retail:orderPaymentTransaction>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</retail:orderPaymentTransaction>
	</xsl:template>
	
	<!-- Matching the top level element directly and output the tag manually. -->
	<!-- The namespaces declared at the top are added to the output automatically. -->
	<!-- Note. 'element' will only allow one namespace. -->
	<xsl:template match="orders:customerOrderSaleTransaction">
		<retail:customerOrderSaleTransaction>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</retail:customerOrderSaleTransaction>
	</xsl:template>
	
	<xsl:template match="core:applicationRequestMessage">
		<core:applicationRequestMessage>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</core:applicationRequestMessage>
	</xsl:template>
	
	<xsl:template match="orders:*">
		<xsl:element name="retail:{local-name()}" namespace="http://www.enactor.com/retail">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="orders:address">
		<retail:address>
			<xsl:apply-templates/>
		</retail:address>
	</xsl:template>	
	
	<xsl:template match="orders:name">
		<retail:name>
			<xsl:apply-templates/>
		</retail:name>
	</xsl:template>	
	
	<xsl:template match="orders:createdDate">
        <retail:createdDate xsi:type="core:DateTimeWithTimeZone" xmlns:core="http://www.enactor.com/core" >
			<xsl:apply-templates/>
		</retail:createdDate>
	</xsl:template>	
	
	<xsl:template match="orders:submittedDate">
        <retail:submittedDate xsi:type="core:DateTimeWithTimeZone" xmlns:core="http://www.enactor.com/core" >
			<xsl:apply-templates/>
		</retail:submittedDate>
	</xsl:template>	
	
	<xsl:template match="orders:authorisedDate">
		<retail:authorisedDate xsi:type="core:DateTimeWithTimeZone" xmlns:core="http://www.enactor.com/core" >
			<xsl:apply-templates/>
		</retail:authorisedDate>
	</xsl:template>	
	
	<xsl:template match="@xsi:type">
		<xsl:variable name="prefix" select="substring-before(.,':')"/>
		<xsl:variable name="namespace">
			<xsl:choose>
				<xsl:when test="namespace::node()[local-name()=$prefix]">
					<xsl:value-of select="namespace::node()[local-name()=$prefix]" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="ancestor::*/namespace::node()[local-name()=$prefix]" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:attribute name="xsi:type">
			<xsl:choose>
				<xsl:when test="$namespace = 'http://www.enactor.com/orders'">
					<xsl:text>retail:</xsl:text>
					<xsl:value-of select="substring-after(.,':')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="*" priority="-1">
		<xsl:element name="{name()}" namespace="{namespace-uri()}">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="@*" priority="-1">
		<xsl:copy/>
	</xsl:template>
</xsl:stylesheet>