<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ns3="http://www.enactor.com/core" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	version="1.0" exclude-result-prefixes="xsl xsi ns3">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="ns3:applicationProcessLogEntry">
		<entryDateTime>
			<xsl:value-of select="ns3:entryDateTime" />
		</entryDateTime>
		<logEntryId>
			<xsl:value-of select="ns3:logEntryId" />
		</logEntryId>
		<deviceId>
			<xsl:value-of select="ns3:deviceId" />
		</deviceId>
		<entryType>
			<xsl:value-of select="ns3:entryType" />
		</entryType>
		<messageBase>
			<xsl:value-of select="ns3:messageBase" />
		</messageBase>
		<messageId>
			<xsl:value-of select="ns3:messageId" />
		</messageId>
		<messageText>
			<xsl:value-of select="ns3:messageText" />
		</messageText>
		<processId>
			<xsl:value-of select="ns3:processId" />
		</processId>
		<referenceId>
			<xsl:value-of select="ns3:referenceId" />
		</referenceId>
	</xsl:template>
</xsl:stylesheet>