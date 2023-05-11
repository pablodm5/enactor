<?xml version="1.0" encoding="UTF-8" ?>

<!-- Transforms Enactor transaction data into a Fintrax Detailed DCC Hit Rate CSV file. -->
<xsl:stylesheet version="2.0" exclude-result-prefixes="xsl xsd xalan java"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:xalan="http://xml.apache.org/xslt" xmlns:core="http://www.enactor.com/core"
	xmlns:retail="http://www.enactor.com/retail" xmlns:java="http://xml.apache.org/xslt/java">

	<xsl:output method="text" omit-xml-declaration="yes" indent="no" />

	<!-- The value to use as the merchant name -->
	<xsl:param name="merchantName" />
	
	<!-- The value to use as the merchant address -->
	<xsl:param name="merchantAddress" />
	
	<!-- Whether to enable debug, like outputting headers -->
	<xsl:param name="isDebug" />

	<!-- Handle batches of transactions with core prefix -->
	<xsl:template match="core:Batch">

		<xsl:if test="retail:*/retail:basket/retail:items/retail:cardTenderItem">
			<xsl:if test="retail:*/retail:trainingDetails/retail:trainingMode = 'false'">
				<xsl:if test="$isDebug">
					<xsl:call-template name="header" /> 
				</xsl:if>
		
				<!-- Data Rows -->
				<xsl:for-each select="*">
					<xsl:if test="retail:basket/retail:items/retail:cardTenderItem">			
						<xsl:call-template name="transaction" />
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
		</xsl:if>

	</xsl:template>
	
	<!-- Handle batches of transactions with no core prefix -->
	<xsl:template match="Batch">

		<xsl:if test="retail:*/retail:basket/retail:items/retail:cardTenderItem">
			<xsl:if test="retail:*/retail:trainingDetails/retail:trainingMode = 'false'">
				<xsl:if test="$isDebug">
					<xsl:call-template name="header" /> 
				</xsl:if>
		
				<!-- Data Rows -->
				<xsl:for-each select="*">
					<xsl:if test="retail:basket/retail:items/retail:cardTenderItem">			
						<xsl:call-template name="transaction" />
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
		</xsl:if>

	</xsl:template>

	<!-- Handle single transaction -->
	<xsl:template match="retail:*">
		<xsl:if test="retail:basket/retail:items/retail:cardTenderItem">
			<xsl:if test="retail:trainingDetails/retail:trainingMode = 'false'">
				<xsl:if test="$isDebug">
					<xsl:call-template name="header" /> 
				</xsl:if>
				<xsl:call-template name="transaction" />
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<!-- Header -->
	<xsl:template name="header">

		<!-- Header Row -->
		<xsl:text>Date</xsl:text>
		<xsl:text>,</xsl:text>

		<xsl:text>AcquirerID</xsl:text>
		<xsl:text>,</xsl:text>

		<xsl:text>MID</xsl:text>
		<xsl:text>,</xsl:text>

		<xsl:text>TID</xsl:text>
		<xsl:text>,</xsl:text>

		<xsl:text>MerchantName</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>MerchantAddress</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>BatchNumber</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>TxnNumber</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>TxnDate</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>TxnTime</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>TxnType</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>TillNUmber</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>PAN8Digits</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>LocalAmount</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>LocalCny</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>DCCAmount</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>DCCCny</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>TransactionResult</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>DCCAcceptance</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>RFU1</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>RFU2</xsl:text>
		<xsl:text>,</xsl:text>
		
		<xsl:text>RFU3</xsl:text>
		<xsl:text>&#xA;</xsl:text>

	</xsl:template>

	<!-- Transaction -->
	<xsl:template name="transaction">
	
		<xsl:variable name="transactionId">
			<xsl:value-of select="normalize-space(retail:transactionId)" />
		</xsl:variable>
		<xsl:variable name="terminalNumber">
			<xsl:value-of select="retail:completedBy/retail:terminalNumber" />
		</xsl:variable>
		<xsl:variable name="branchNumber">
			<xsl:value-of select="retail:completedBy/retail:branchNumber" />
		</xsl:variable>
		<xsl:variable name="transactionNumber">
			<xsl:value-of select="retail:transactionNumber" />
		</xsl:variable>
		<xsl:variable name="dateTimeCompleted">
			<xsl:value-of select="retail:dateTimeCompleted" />
		</xsl:variable>
		<xsl:variable name="branchName">
			<xsl:value-of select="normalize-space(retail:completedBy/retail:branchName)" />
		</xsl:variable>
		<xsl:variable name="localCurrency">
			<xsl:value-of select="retail:basket/retail:currencyId" />
		</xsl:variable>
		<xsl:variable name="uniqueTransactionId">
			<xsl:value-of select="$branchNumber" />
			<xsl:value-of select="$terminalNumber" />
			<xsl:value-of select="$transactionNumber" />
		</xsl:variable>
		
		<xsl:for-each select="retail:basket/retail:items/retail:cardTenderItem">

			<!-- Date: Extraction period date in DD/MM/YYYY format. This would typically be equal to the previous day. -->
			<xsl:call-template name="date">
				<xsl:with-param name="value" select="$dateTimeCompleted" />
			</xsl:call-template>
			<xsl:text>;</xsl:text>
	
			<!-- AcquirerID: The unique Acquirer ID assigned by Fintrax -->
			<xsl:value-of select="retail:acquirerKey/retail:acquirerId" />
			<xsl:text>;</xsl:text>
			
			<!-- MID: The Merchant ID assigned by Fintrax or the Acquirer. Leave empty if not relevant -->
			<xsl:value-of select="retail:eftMerchantId" />
			<xsl:text>;</xsl:text>
			
			<!-- TID: The Terminal ID assigned by Fintrax or the Acquirer. This field is mandatory. -->
			<xsl:choose>
				<xsl:when test="retail:eftTerminalId and retail:eftTerminalId != ''">
					<xsl:value-of select="retail:eftTerminalId" />
				</xsl:when>
				<xsl:otherwise>
					<!-- If not defined, default to 8 nines -->
					<xsl:text>99999999</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>;</xsl:text>
			
			<!-- Merchant Name: The merchant name -->
			<xsl:value-of select="$merchantName" />
			<xsl:text>;</xsl:text>
			
			<!-- Merchant Address: The merchant address. This should not contain any semicolon, new line or double quote. -->
			<!-- xsl:value-of select="$merchantAddress" /-->
			<!-- DH: We're just using branch name here as otherwise we'd have to look up each transaction's store details -->
			<xsl:value-of select="$branchName" />
			<xsl:text>;</xsl:text>
			
			<!-- BatchNumber: The transaction’s batch number. -->
			<!-- DH: Default to 5 zeroes -->
			<xsl:text>00000</xsl:text>
			<xsl:text>;</xsl:text>
			
			<!-- TxnNumber: The transaction’s number. -->
			<xsl:value-of select="$uniqueTransactionId" />
			<xsl:text>;</xsl:text>
			
			<!-- TxnDate: The transaction’s date in DD/MM/YYYY format. Note that this could be different from the field ‘Date’ above, as in some cases, the POS may batch-in the transaction late. -->
			<xsl:call-template name="date">
				<xsl:with-param name="value" select="$dateTimeCompleted" />
			</xsl:call-template>
			<xsl:text>;</xsl:text>
			
			<!-- TxnTime: The transaction time in 24h hour format: HH:MM:SS -->
			<xsl:call-template name="time">
				<xsl:with-param name="value" select="$dateTimeCompleted" />
			</xsl:call-template>
			<xsl:text>;</xsl:text>
			
			<!-- TxnType: The transaction’s type: 00 for a sale. 20 for a refund. 81 for a completion of a pre-authorization -->
			<xsl:choose>
				<xsl:when test="retail:isRefund != '' and retail:isRefund = 'true'">20</xsl:when>
				<xsl:otherwise>00</xsl:otherwise>
			</xsl:choose>
			<xsl:text>;</xsl:text>
			
			<!-- TillNumber: The number of the till or POS that performed this transaction. This is mostly used in an integrated solution environment. Leave empty if not relevant. -->
			<xsl:value-of select="$terminalNumber" />
			<xsl:text>;</xsl:text>
			
			<!-- PAN8Digits: The first 8 digits of the PAN -->
			<!-- DH: We only have 6 - append XX to the end -->
			<xsl:value-of select="retail:cardDetails/retail:panIIN" />
			<xsl:text>XX</xsl:text>
			<xsl:text>;</xsl:text>
			
			<!-- LocalAmount: The transaction amount, in merchant local currency, expressed in the smallest currency unit. -->
			<xsl:choose>
				<xsl:when test="retail:tenderAmount != ''">
					<xsl:value-of select="retail:tenderAmount" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>;</xsl:text>
			
			<!-- LocalCny: The merchant’s local currency (ISO3 alpha code) -->
			<xsl:value-of select="$localCurrency" />
			<xsl:text>;</xsl:text>
			
			<!-- DCCAmount: The field should contain:
					o If the transaction was eligible for DCC and cardholder accepted the DCC offer: The transaction’s DCC amount expressed in the smallest currency unit.
					o If the transaction was eligible for DCC and cardholder declined the DCC offer: The transaction’s DCC amount expressed in the smallest currency unit (e.g. same as if the cardholder accepted DCC)
					o If the transaction was not eligible for DCC:
						- The DCC amount expressed in the smallest currency unit, if this amount was returned by the DCC Gateway
						- Otherwise, an empty value -->
			<xsl:choose>
				<xsl:when test="retail:foreignAmount != ''">
					<xsl:value-of select="retail:foreignAmount" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="retail:exchangeRate != '' and retail:tenderAmount != ''">
							<xsl:value-of select="floor(number(retail:tenderAmount * retail:exchangeRate))"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>0</xsl:text> <!-- DH: Not in their spec but they requested it -->
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>;</xsl:text>
				 
			<!-- DCCCny: This field should contain:
					o If the transaction was eligible for DCC and cardholder accepted the DCC offer: the DCC ISO3 Alpha currency code
					o If the transaction was eligible for DCC and cardholder declined the DCC offer: the DCC ISO3 Alpha currency code (e.g. same as if the cardholder accepted DCC)
					o If the transaction was not eligible for DCC:
						The DCC ISO3 Alpha currency code, if the currency code was returned by the DCC Gateway
				 		Otherwise, an empty value -->
			<xsl:value-of select="retail:dccCurrencyId" />
			<xsl:text>;</xsl:text>
				
			<!-- TransactionResult: The transaction result. This field can take one of the following
					values:
					o 0 The transaction was approved
					o 1 The transaction was declined
					o 2 The transaction was approved through a voice call process
					o 3 The transaction was declined through a voice call process -->
			<xsl:choose>
				<xsl:when test="retail:authorisationCode != ''">
					<xsl:choose>
						<xsl:when test="retail:authorisationCodeKeyed = 'true'">2</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="retail:voidReasons/item = 'REFERRAL_DECLINED'">3</xsl:when>
						<xsl:otherwise>1</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>;</xsl:text>
					
			<!-- DCCAcceptance: The status of the DCC acceptance and/or eligibility. This field can
					take one of the following values (subject to the DCC implementation being capable 
					of sending them):
					o 0: The card is eligible for DCC and the cardholder accepted the DCC offer
					o 1: The card is eligible for DCC and the cardholder declined the DCC offer
					o 100: The card is not eligible for DCC because it did not have any rate
					o 101: The card is not eligible for DCC because it was not present in CRT -->
			<xsl:choose>
				<xsl:when test="retail:dccNotOffered != ''">
					<xsl:choose>
						<xsl:when test="retail:dccNotOffered = 'NO_VALID_EXCHANGE_RATE'">100</xsl:when>
						<xsl:when test="retail:dccNotOffered = 'IIN_RANGE_NOT_FOUND'">101</xsl:when>
						<xsl:otherwise>101</xsl:otherwise> <!-- DH: not in their spec but we have some other cases e.g. not enabled for currency -->
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="retail:dccAccepted != '' and retail:dccAccepted = 'true'">0</xsl:when>
						<xsl:when test="retail:dccAccepted != '' and retail:dccAccepted = 'false'">1</xsl:when>
						<xsl:otherwise>101</xsl:otherwise> <!-- DH: Should catch edge cases -->
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>;</xsl:text>
					
			<!-- CardCapture: The process used to capture the card information. This field can take one of the following values:
					o 0 if the card information was read from the chip reader
					o 1 if the card information was read from the magstripe reader
					o 2 if the card information was manually keyed-in on the POS
					o 3 if the card information was entered on an E-Commerce site
					o 4 if the card information was read through the contactless reader -->
			<!-- DH: Think this is RFU1 in header. 3 not supported yet. -->
			<xsl:choose>
				<xsl:when test="retail:cardDetails/retail:icc = 'true'">
					<xsl:choose>
						<xsl:when test="retail:cardDetails/retail:contactless = 'true'">4</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="retail:cardDetails/retail:swiped = 'true'">1</xsl:when>
				<xsl:when test="retail:cardDetails/retail:keyed = 'true'">2</xsl:when>
			</xsl:choose>
			<xsl:text>;</xsl:text>

			<!-- RFU2: This field is reserved for future usage. It should be left empty for now -->
			<xsl:text>;</xsl:text>
			
			<!-- RFU3: This field is reserved for future usage. It should be left empty for now -->
			<xsl:text>&#xA;</xsl:text>
		
		</xsl:for-each>
			
	</xsl:template>

	<xsl:template match="*|@*|text()" priority="-1">
		<!-- Ignore -->
	</xsl:template>
	
	<!-- Convert YYYY-MM-DDTHH:MM:SS-Z to DD/MM/YYYY -->
	<!-- 2015-10-26T14:33:32Z -> 26/10/2015
		 2014-10-27T11:25:05-04:00 -> 27/10/2014 -->
	<xsl:template name="date">
		<xsl:param name="value" />

		<xsl:variable name="date" select="substring-before($value, 'T')" />

		<xsl:call-template name="string-replace-all">
			<xsl:with-param name="text" select="$date"/>
			<xsl:with-param name="replace" select="'-'" />
			<xsl:with-param name="by" select="'/'" />
		</xsl:call-template>

	</xsl:template>
	
	<!-- Convert YYYY-MM-DDTHH:MM:SS-Z to HH:MM:SS -->
	<!-- 2015-10-26T14:33:32Z -> 14:33:32
		 2014-10-27T11:25:05-04:00 -> 11:25:05 -->
	<xsl:template name="time">
		<xsl:param name="value" />

		<xsl:variable name="time-all" select="substring-after($value, 'T')" />
		<xsl:variable name="timeminus" select="substring-before($time-all, '-')" />
		<xsl:variable name="timeplus" select="substring-before($time-all, '+')" />
		<xsl:variable name="timezulu" select="substring-before($time-all, 'Z')" />

		<xsl:choose>
			<xsl:when test="contains($time-all, 'Z')">
				<xsl:value-of select="$timezulu" />
			</xsl:when>
			<xsl:when test="contains($time-all, '-')">
				<xsl:value-of select="$timeminus" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$timeplus" />
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
	
	<!-- Replace all template -->
	<xsl:template name="string-replace-all">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="by" />
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of select="substring-before($text,$replace)" />
				<xsl:value-of select="$by" />
				<xsl:call-template name="string-replace-all">
					<xsl:with-param name="text"
						select="substring-after($text,$replace)" />
					<xsl:with-param name="replace" select="$replace" />
					<xsl:with-param name="by" select="$by" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>