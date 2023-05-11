<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xalan="http://xml.apache.org/xalan"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
	
	xmlns:core="http://www.enactor.com/core"
	xmlns:orders="http://www.enactor.com/orders"
	xmlns:retail="http://www.enactor.com/retail"
	xmlns:service="http://www.enactor.com/orders/CustomerQuotesService"
	
	xmlns:enactor="com.enactor.commonUI.transforms.XalanExtensions"
	extension-element-prefixes="enactor"
	exclude-result-prefixes="xsi xsl xalan">

	<!-- Match the document element -->
	<xsl:template match="service:*">
		<xsl:copy>
			<xsl:attribute name="xsd:dummy"/>
			
			<xsl:apply-templates select="@*"/>

			<xsl:for-each select="*">
				<enactor:copy name="orders:{local-name()}" namespace="http://www.enactor.com/orders">
					<xsl:apply-templates/>
				</enactor:copy>
			</xsl:for-each>	
		</xsl:copy>
	</xsl:template>

	<xsl:template match="retail:*">
		<xsl:element name="orders:{local-name()}" namespace="http://www.enactor.com/orders">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates />
		</xsl:element>
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
				<xsl:when test="$namespace = 'http://www.enactor.com/retail'">
					<xsl:text>orders:</xsl:text>
					<xsl:value-of select="substring-after(.,':')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	
	<!-- Overrides to stop some elements switching to the orders namespace -->
	
	<xsl:template match="retail:isRefund">
		<orders:isRefund>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:isRefund>
	</xsl:template>
	
	<xsl:template match="retail:newContactDetails">
		<orders:newContactDetails>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:newContactDetails>
	</xsl:template>
	
	
	<xsl:template match="retail:cardDetails">
		<orders:cardDetails>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="retail" />
		</orders:cardDetails>
	</xsl:template>
	
	
	<xsl:template match="retail:destinationAddress">
		<orders:destinationAddress>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="retail" />
		</orders:destinationAddress>
	</xsl:template>
	
	<xsl:template match="retail:destinationName">
		<orders:destinationName>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="retail" />
		</orders:destinationName>
	</xsl:template>

	<xsl:template match="retail:name">
		<orders:name>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="retail" />
		</orders:name>
	</xsl:template>

	<xsl:template match="retail:tenderId">
		<orders:tenderId>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="retail" />
		</orders:tenderId>
	</xsl:template>

	
	<xsl:template match="retail:customerOrderHeader">
		<orders:customerOrderHeader>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="address" />
		</orders:customerOrderHeader>
	</xsl:template>
	
	<xsl:template match="retail:customerOrderItem">
		<orders:customerOrderItem>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="address" />
		</orders:customerOrderItem>
	</xsl:template>
	
	<xsl:template match="retail:customerQuoteCreateHeaderMessage">
		<orders:customerQuoteCreateHeaderMessage>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="address" />
		</orders:customerQuoteCreateHeaderMessage>
	</xsl:template>
	
	<xsl:template match="retail:customerQuoteCreateItemMessage">
		<orders:customerQuoteCreateItemMessage>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="address" />
		</orders:customerQuoteCreateItemMessage>
	</xsl:template>
	
	<xsl:template match="retail:accountPayment">
		<orders:accountPayment>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates select="*" mode="accountPayment"/>
		</orders:accountPayment>
	</xsl:template>
	<xsl:template match="retail:cardPayment">
		<orders:cardPayment>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates select="*" mode="cardPayment"/>
		</orders:cardPayment>
	</xsl:template>
	<xsl:template match="retail:cashPayment">
		<orders:cashPayment>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates select="*" mode="cashPayment"/>
		</orders:cashPayment>
	</xsl:template>
	<xsl:template match="retail:chequePayment">
		<orders:chequePayment>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates select="*" mode="chequePayment"/>
		</orders:chequePayment>
	</xsl:template>
	
	<!-- 													 -->
	
	<xsl:template match="retail:destination" mode="address">
		<orders:destination>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:destination>
	</xsl:template>
		
	<xsl:template match="retail:contactAddress" mode="address">
		<orders:contactAddress>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:contactAddress>
	</xsl:template>
	
	<xsl:template match="retail:deliveryAddress" mode="address">
		<orders:deliveryAddress>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
						
		</orders:deliveryAddress>
	</xsl:template>
	
	<xsl:template match="retail:address">
		<orders:address>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="retail" />
		</orders:address>
	</xsl:template>	
	
	<xsl:template match="retail:address" mode="address">
		<orders:address>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="retail" />
		</orders:address>
	</xsl:template>			
		
	<xsl:template match="retail:billingAddress">
		<orders:billingAddress>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="retail" />
		</orders:billingAddress>
	</xsl:template>	
	
	<xsl:template match="retail:orderItemRequest">
		<orders:orderItemRequest>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:orderItemRequest>
	</xsl:template>
	
	<xsl:template match="retail:deliveryTypeId">
		<orders:deliveryTypeId>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:deliveryTypeId>
	</xsl:template>
	
	<xsl:template match="retail:productQuantity">
		<orders:productQuantity>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:productQuantity>
	</xsl:template>
	
	<xsl:template match="retail:productDimensions">
		<orders:productDimensions>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="retail" />
		</orders:productDimensions>
	</xsl:template>
	
	<xsl:template match="retail:productAttribute">
		<orders:productAttribute>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:productAttribute>
	</xsl:template>
	
	<xsl:template match="retail:reasonKey">
		<orders:reasonKey>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:reasonKey>
	</xsl:template>	
	
	<xsl:template match="retail:*" mode="address" priority="-1">
		<xsl:element name="orders:{local-name()}" namespace="http://www.enactor.com/orders">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	
	<!-- The payments used in CreateOrderTransaction.customerOrderPayments -->
	<!-- Currently only 4 types are supported. (04/05/2016) -->
	<!-- accountPayment, cardPayment, cashPayment and chequePayment  -->
	
	<xsl:template match="retail:tenderId" mode="accountPayment">
		<orders:tenderId>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:tenderId>
	</xsl:template>
		
	<xsl:template match="retail:*" mode="accountPayment" priority="-1">
		<xsl:element name="orders:{local-name()}" namespace="http://www.enactor.com/orders">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	
	
	<xsl:template match="retail:cardDetails" mode="cardPayment">
		<orders:cardDetails>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:cardDetails>
	</xsl:template>
	
	<xsl:template match="retail:cardDetails" mode="cardRefund">
		<orders:cardDetails>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:cardDetails>
	</xsl:template>
		
		
	<xsl:template match="retail:tenderId" mode="cardPayment">
		<orders:tenderId>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:tenderId>
	</xsl:template>
	
	<xsl:template match="retail:isRefund" mode="cardPayment">
		<orders:isRefund>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:isRefund>
	</xsl:template>
	
	<xsl:template match="retail:billingAddressContactTypeId" mode="cardPayment">
		<orders:billingAddressContactTypeId>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:billingAddressContactTypeId>
	</xsl:template>

		
	<xsl:template match="retail:*" mode="cardPayment" priority="-1">
		<xsl:element name="orders:{local-name()}" namespace="http://www.enactor.com/orders">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>	
	
	<xsl:template match="retail:tenderId" mode="cashPayment">
		<orders:tenderId>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:tenderId>
	</xsl:template>
		
	<xsl:template match="retail:*" mode="cashPayment" priority="-1">
		<xsl:element name="orders:{local-name()}" namespace="http://www.enactor.com/orders">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	
	
	<xsl:template match="retail:tenderId" mode="chequePayment">
		<orders:tenderId>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:tenderId>
	</xsl:template>
		
	<xsl:template match="retail:*" mode="chequePayment" priority="-1">
		<xsl:element name="orders:{local-name()}" namespace="http://www.enactor.com/orders">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="retail:orderProductLineQuantityDetail">
		<orders:orderProductLineQuantityDetail>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="orderProductLineQuantityDetail" />
		</orders:orderProductLineQuantityDetail>
	</xsl:template>	
	
	<xsl:template match="retail:productLineQuantityDetail">
		<orders:productLineQuantityDetail>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="orderProductLineQuantityDetail" />
		</orders:productLineQuantityDetail>
	</xsl:template>	
	
	
	<xsl:template match="retail:reasonKey">
		<orders:reasonKey>
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</orders:reasonKey>
	</xsl:template>	
	
	<xsl:template match="*" priority="-1" mode="retail">
		<xsl:element name="{name()}" namespace="{namespace-uri()}">
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />
		</xsl:element>
	</xsl:template>
	
	
	<xsl:template match="*" priority="-1" mode="orderProductLineQuantityDetail">
		<xsl:element name="{name()}" namespace="{namespace-uri()}">
			<xsl:copy-of select="@*"/>
			
			<xsl:apply-templates mode="retail" />			
			
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="retail:refundNow" mode="orderProductLineQuantityDetail">
		<orders:refundNow><xsl:value-of select="."></xsl:value-of></orders:refundNow>
	</xsl:template>
	
		<xsl:template match="retail:requiresReturnLogistics" mode="orderProductLineQuantityDetail">
		<orders:requiresReturnLogistics><xsl:value-of select="."></xsl:value-of></orders:requiresReturnLogistics>
	</xsl:template>
	
</xsl:stylesheet>
