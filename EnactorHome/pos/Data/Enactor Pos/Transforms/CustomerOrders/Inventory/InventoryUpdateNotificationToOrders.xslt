<!--
	A transform that accepts an InventoryUpdateNotification from the inventory
	system and transforms it into an InventoryUpdateNotification understood
	by the order system.
	
	The order system variant only includes some of the details of the entity
	from the inventory system. 
 -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xalan="http://xml.apache.org/xalan"
	xmlns:exsl="http://exslt.org/common"

	xmlns:core="http://www.enactor.com/core"
	xmlns:orders="http://www.enactor.com/orders"
	xmlns:inventory="http://www.enactor.com/retail"
	xmlns:retail="http://www.enactor.com/retail"
	
	xmlns:enactor="com.enactor.commonUI.transforms.XalanExtensions"
	
	extension-element-prefixes="exsl enactor"
	exclude-result-prefixes="xsi xsl xalan">
	
<xsl:output method="xml" indent="yes" xalan:indent-amount="3"/>

<xsl:template match="inventory:inventoryUpdateNotification">
	<!-- The elements we want to copy to the core namespace -->
	<xsl:variable name="coreElements">
		<element>applicationId</element>
		<element>transactionId</element>
		<element>sequenceNumber</element>
		<element>source</element>
		<element>sourceApplication</element>
		<element>topic</element>
		<element>userId</element>
	</xsl:variable>
	<xsl:variable name="coreElementsSet" select="exsl:node-set($coreElements)"/>
	
	<!-- The elements we want to copy to the orders namespace -->
	<xsl:variable name="orderElements">
		<element>updateType</element>
		<element>notificationReason</element>
	</xsl:variable>
	<xsl:variable name="orderElementsSet" select="exsl:node-set($orderElements)"/>

	<orders:inventoryUpdateNotification>
		<!-- Copy the core and order stuff -->
		<xsl:apply-templates select="inventory:*[local-name() = $coreElementsSet/element]" mode="translateAndCopy-Core"/>
		<xsl:apply-templates select="inventory:*[local-name() = $orderElementsSet/element]" mode="translateAndCopy-Orders"/>
		
		<!-- Apply templates for everything else -->
		<xsl:apply-templates select="inventory:*[not(local-name() = $coreElementsSet/element) and not(local-name() = $orderElementsSet/element)]"/>
	</orders:inventoryUpdateNotification>
</xsl:template>
	
<xsl:template match="inventory:*" mode="translateAndCopy-Core">
	<xsl:element name="core:{local-name()}" namespace="http://www.enactor.com/core">
		<xsl:copy-of select="@*|text()"/>
	</xsl:element>
</xsl:template>
	
<xsl:template match="inventory:*" mode="translateAndCopy-Orders">
	<xsl:element name="orders:{local-name()}" namespace="http://www.enactor.com/orders">
		<xsl:copy-of select="@*|text()"/>
	</xsl:element>
</xsl:template>

<xsl:template match="inventory:customerDistributionOrderHeader">
	<orders:documentId>
		<xsl:value-of select="inventory:distributionOrderId"/>
	</orders:documentId>
	
	<xsl:call-template name="copy-common-properties"/>
</xsl:template>

<xsl:template match="inventory:customerAddressDistributionOrderHeader">
	<orders:documentId>
		<xsl:value-of select="inventory:distributionOrderId"/>
	</orders:documentId>
	
	<xsl:call-template name="copy-common-properties"/>
</xsl:template>

<xsl:template match="inventory:customerDistributionRequestHeader">
	<orders:documentId>
		<xsl:value-of select="inventory:distributionRequestId"/>
	</orders:documentId>
	
	<xsl:call-template name="copy-common-properties"/>
</xsl:template>

<xsl:template match="inventory:customerAddressDistributionRequestHeader">
	<orders:documentId>
		<xsl:value-of select="inventory:distributionRequestId"/>
	</orders:documentId>
	
	<xsl:call-template name="copy-common-properties"/>
</xsl:template>

<xsl:template match="inventory:customerStockAdjustmentHeader">
	<orders:documentId>
		<xsl:value-of select="inventory:stockAdjustmentId"/>
	</orders:documentId>
	
	<xsl:call-template name="copy-common-properties"/>
</xsl:template>

<xsl:template match="inventory:stockAdjustmentHeader">
	<orders:documentId>
		<xsl:value-of select="inventory:stockAdjustmentId"/>
	</orders:documentId>
	
	<xsl:call-template name="copy-common-properties"/>
</xsl:template>

<xsl:template name="copy-common-properties">
	<orders:documentType>
		<xsl:value-of select="local-name()"/>
	</orders:documentType>
	<orders:documentStatus>
		<xsl:value-of select="inventory:status"/>
	</orders:documentStatus>
	<orders:customerOrderId>
		<xsl:value-of select="inventory:customerOrderId"/>
	</orders:customerOrderId>
	<orders:externalReferenceId>
		<xsl:value-of select="inventory:externalReferenceId"/>
	</orders:externalReferenceId>
	<orders:referenceId>
		<xsl:value-of select="inventory:referenceId"/>
	</orders:referenceId>
	<orders:destinationLocationId>
		<xsl:value-of select="inventory:destinationLocationId"/>
	</orders:destinationLocationId>
</xsl:template>

<xsl:template match="*|@*|text()" priority="-1">
	<!-- Ignore -->
</xsl:template>

<xsl:template match="inventory:fulfilmentCalculationResponse">
	<orders:fulfilmentCalculationResponse>
	<!-- The elements we want to copy to the core namespace -->
	<xsl:variable name="coreElements">
		<element>applicationId</element>
		<element>transactionId</element>
		<element>sequenceNumber</element>
		<element>source</element>
		<element>sourceApplication</element>
		<element>topic</element>
		<element>userId</element>
	</xsl:variable>
	<xsl:variable name="coreElementsSet" select="exsl:node-set($coreElements)"/>
	
	<!-- The elements we want to copy to the orders namespace -->
	<xsl:variable name="orderElements">
		<element>updateType</element>
		<element>notificationReason</element>
		<element>customerOrderId</element>
		<element>bpInstanceId</element>
		<element>isReversal</element>
		<element>stockProcessingMode</element>
	</xsl:variable>
	<xsl:variable name="orderElementsSet" select="exsl:node-set($orderElements)"/>

	<!-- Copy the core and order stuff -->
	<xsl:apply-templates select="inventory:*[local-name() = $coreElementsSet/element]" mode="translateAndCopy-Core"/>
	<xsl:apply-templates select="inventory:*[local-name() = $orderElementsSet/element]" mode="translateAndCopy-Orders"/>
	
	<!-- Apply templates for everything else -->
	<xsl:apply-templates select="inventory:*[not(local-name() = $coreElementsSet/element) and not(local-name() = $orderElementsSet/element)]" mode="fulfilmentCalculationResponse"/>
	</orders:fulfilmentCalculationResponse>
</xsl:template>

<xsl:template match="inventory:deliveryOptions" mode="fulfilmentCalculationResponse">
	<orders:deliveryOptions>
		<xsl:for-each select="*">	
			<xsl:apply-templates select="." mode="fulfilmentCalculationResponse"/>
		</xsl:for-each>
	</orders:deliveryOptions>
</xsl:template>

<xsl:template match="inventory:currentLevels" mode="fulfilmentCalculationResponse">
	<orders:currentLevels>
		<xsl:for-each select="*">	
			<xsl:apply-templates select="." mode="fulfilmentCalculationResponse"/>
		</xsl:for-each>
	</orders:currentLevels>
</xsl:template>

<xsl:template match="inventory:orderItemRequests" mode="fulfilmentCalculationResponse">
	<orders:orderItemRequests>
		<xsl:for-each select="*">	
			<xsl:apply-templates select="." mode="fulfilmentCalculationResponse"/>
		</xsl:for-each>
	</orders:orderItemRequests>
</xsl:template>

<xsl:template match="inventory:addressDeliveryOption" mode="fulfilmentCalculationResponse">
	<orders:addressDeliveryOption>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="inventory:deliverySlot" mode="fulfilmentCalculationResponse"/>
			<xsl:apply-templates select="inventory:address" mode="fulfilmentCalculationResponse"/>
			<xsl:apply-templates select="inventory:name" mode="fulfilmentCalculationResponse"/>
	</orders:addressDeliveryOption>
</xsl:template>

<xsl:template match="inventory:locationCollectionDeliveryOption" mode="fulfilmentCalculationResponse">
	<orders:locationCollectionDeliveryOption>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="inventory:deliverySlot" mode="fulfilmentCalculationResponse"/>
			<orders:locationId><xsl:value-of select="inventory:locationId"/></orders:locationId>
	</orders:locationCollectionDeliveryOption>
</xsl:template>

<xsl:template match="inventory:currentLevel" mode="fulfilmentCalculationResponse">
	<orders:currentLevel>
		<retail:productKey><xsl:value-of select="inventory:productKey"/></retail:productKey>
		<retail:quantity><xsl:value-of select="inventory:quantity"/></retail:quantity>		
		<retail:locationId><xsl:value-of select="inventory:locationId"/></retail:locationId>
	</orders:currentLevel>
</xsl:template>

<xsl:template match="inventory:orderItemRequest" mode="fulfilmentCalculationResponse">
	<orders:orderItemRequest>
		<retail:productKey><xsl:value-of select="inventory:productKey"/></retail:productKey>
		<retail:quantity><xsl:value-of select="inventory:quantity"/></retail:quantity>		
	</orders:orderItemRequest>
</xsl:template>

<xsl:template match="inventory:deliverySlot"  mode="fulfilmentCalculationResponse">
	<orders:deliverySlot>
		<orders:currencyId></orders:currencyId>
		<xsl:apply-templates select="inventory:fulfilmentOptions" mode="fulfilmentCalculationResponse"/>
	</orders:deliverySlot>	
</xsl:template>

<xsl:template match="inventory:address" mode="fulfilmentCalculationResponse">
	<orders:address>
		<retail:country><xsl:value-of select="inventory:country"/></retail:country>
		<retail:countryCodeId><xsl:value-of select="inventory:countryCodeId"/></retail:countryCodeId>		
		<retail:organisation><xsl:value-of select="inventory:organisation"/></retail:organisation>
		<retail:typeId><xsl:value-of select="inventory:typeId"/></retail:typeId>
		<retail:county><xsl:value-of select="inventory:county"/></retail:county>		
		<retail:postCode><xsl:value-of select="inventory:postCode"/></retail:postCode>
		<retail:street1><xsl:value-of select="inventory:street1"/></retail:street1>
		<retail:street2><xsl:value-of select="inventory:street2"/></retail:street2>
		<retail:town><xsl:value-of select="inventory:town"/></retail:town>
		<retail:isTemplate><xsl:value-of select="inventory:isTemplate"/></retail:isTemplate>
		<retail:lastUpdated><xsl:value-of select="inventory:street1"/></retail:lastUpdated>
	</orders:address>
</xsl:template>

<xsl:template match="inventory:name" mode="fulfilmentCalculationResponse">
	<orders:name>
		<retail:surname><xsl:value-of select="inventory:surname"/></retail:surname>
		<retail:forename><xsl:value-of select="inventory:forename"/></retail:forename>		
		<retail:initials><xsl:value-of select="inventory:initials"/></retail:initials>
		<retail:title><xsl:value-of select="inventory:title"/></retail:title>
		<retail:sex><xsl:value-of select="inventory:sex"/></retail:sex>		
		<retail:dateOfBirth><xsl:value-of select="inventory:dateOfBirth"/></retail:dateOfBirth>
		<retail:otherNames><xsl:value-of select="inventory:otherNames"/></retail:otherNames>
		<retail:jobTitle><xsl:value-of select="inventory:jobTitle"/></retail:jobTitle>
	</orders:name>
</xsl:template>

<xsl:template match="inventory:fulfilmentOptions" mode="fulfilmentCalculationResponse">
	<orders:fulfilmentOptions>
		<xsl:for-each select="*">
			<xsl:apply-templates select="." mode="fulfilmentCalculationResponse"/>
		</xsl:for-each>
	</orders:fulfilmentOptions>
</xsl:template>

<xsl:template match="inventory:locationStockFulfilment" mode="fulfilmentCalculationResponse">
	<xsl:variable name="orderElements">
		<element>productId</element>
		<element>quantity</element>
		<element>locationId</element>
	</xsl:variable>
	<xsl:variable name="orderElementsSet" select="exsl:node-set($orderElements)"/>
	<orders:locationStockFulfilment>
		<xsl:apply-templates select="inventory:*[local-name() = $orderElementsSet/element]" mode="translateAndCopy-Orders"/>
	</orders:locationStockFulfilment>
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
	
<xsl:template match="core:applicationEventMessage">
	<core:applicationEventMessage>
	<!-- The elements we want to copy to the core namespace -->
	<xsl:variable name="coreElements">
		<element>applicationId</element>
		<element>transactionId</element>
		<element>sequenceNumber</element>
		<element>source</element>
		<element>sourceApplication</element>
		<element>topic</element>
		<element>userId</element>
	</xsl:variable>
	<xsl:variable name="coreElementsSet" select="exsl:node-set($coreElements)"/>
	
	<!-- The elements we want to copy to the orders namespace -->
	<xsl:variable name="orderElements">
		<element>updateType</element>
		<element>notificationReason</element>
	</xsl:variable>
	<xsl:variable name="orderElementsSet" select="exsl:node-set($orderElements)"/>


		<!-- Copy the core and order stuff -->
		<xsl:apply-templates select="inventory:*[local-name() = $coreElementsSet/element]" mode="translateAndCopy-Core"/>
		<xsl:apply-templates select="inventory:*[local-name() = $orderElementsSet/element]" mode="translateAndCopy-Orders"/>

		<xsl:apply-templates select="core:*[local-name() ='eventDetail']" mode="translateAndCopy-Core"/>


		
		<!-- Apply templates for everything else -->
		<xsl:apply-templates select="inventory:*[not(local-name() = $coreElementsSet/element) and not(local-name() = $orderElementsSet/element)]"/>	
	</core:applicationEventMessage>
</xsl:template>

<xsl:template match="core:eventDetail" mode="translateAndCopy-Core">
	<core:eventDetail> 
	<xsl:apply-templates select="@*"/>
	<!-- The elements we want to copy to the core namespace -->
	<xsl:variable name="coreElements">
		<element>applicationId</element>
		<element>transactionId</element>
		<element>sequenceNumber</element>
		<element>source</element>
		<element>sourceApplication</element>
		<element>topic</element>
		<element>userId</element>
	</xsl:variable>
	<xsl:variable name="coreElementsSet" select="exsl:node-set($coreElements)"/>
	
	<!-- The elements we want to copy to the orders namespace -->
	<xsl:variable name="orderElements">
		<element>updateType</element>
		<element>notificationReason</element>
	</xsl:variable>
	<xsl:variable name="orderElementsSet" select="exsl:node-set($orderElements)"/>


		<!-- Copy the core and order stuff -->
		<xsl:apply-templates select="inventory:*[local-name() = $coreElementsSet/element]" mode="translateAndCopy-Core"/>
		<xsl:apply-templates select="inventory:*[local-name() = $orderElementsSet/element]" mode="translateAndCopy-Orders"/>

		<xsl:apply-templates select="*[local-name() ='locationInventoryLevels']" mode="copy"/>


		
		<!-- Apply templates for everything else -->
		<xsl:apply-templates select="inventory:*[not(local-name() = $coreElementsSet/element) and not(local-name() = $orderElementsSet/element)]"/>	
	</core:eventDetail>
</xsl:template>
	
<xsl:template match="inventory:locationInventoryLevels" mode="copy">
	<orders:locationInventoryLevels>
	 	<xsl:apply-templates select="*[local-name() ='locationInventoryLevel']" mode="copy"/>
	</orders:locationInventoryLevels>
</xsl:template>

<xsl:template match="inventory:locationInventoryLevel" mode="copy">
	<orders:locationInventoryLevel>
		<retail:locationId><xsl:value-of select="inventory:locationId"/></retail:locationId>
		<retail:productId><xsl:value-of select="inventory:productId"/></retail:productId>
		<retail:inventoryItemType><xsl:value-of select="inventory:inventoryItemType"/></retail:inventoryItemType>
		<retail:inventoryType><xsl:value-of select="inventory:inventoryType"/></retail:inventoryType>
		<retail:value><xsl:value-of select="inventory:value"/></retail:value>
	</orders:locationInventoryLevel>
</xsl:template>

</xsl:stylesheet>