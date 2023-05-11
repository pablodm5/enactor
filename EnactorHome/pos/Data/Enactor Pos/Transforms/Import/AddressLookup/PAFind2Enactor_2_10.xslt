<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:core="http://www.enactor.com/core"
  xmlns:retail="http://www.enactor.com/retail" xmlns:pa="http://services.postcodeanywhere.co.uk/"
  xmlns="http://www.enactor.com/retail"


  xmlns:hta="http://docs.oasis-open.org/ns/bpel4people/ws-humantask/api/200803"
  xmlns:htd="http://docs.oasis-open.org/ns/bpel4people/ws-humantask/200803"
  xmlns:htt="http://docs.oasis-open.org/ns/bpel4people/ws-humantask/types/200803"
  xmlns:ns7="http://www.enactor.com/retail/storedRetailTransaction/service"
  xmlns:ns8="http://www.enactor.com/addressLookup/service" xmlns:sref="http://docs.oasis-open.org/wsbpel/2.0/serviceref"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"


  exclude-result-prefixes="pa">
  <xsl:param name="TOO_MANY_FLAG" select="'TOO_MANY_HITS'" />
  <xsl:output method="xml" encoding="UTF-8" indent="yes" />

  <xsl:template match="pa:CapturePlus_Interactive_Find_v2_10_Response">

    <core:wrappedList>


    <xsl:for-each select="pa:CapturePlus_Interactive_Find_v2_10_Result/pa:CapturePlus_Interactive_Find_v2_10_Results">
            <xsl:call-template name="result"></xsl:call-template>
    </xsl:for-each>
    </core:wrappedList>

  </xsl:template>
  
  <xsl:template match="pa:Response">

    <core:wrappedList>

    <xsl:for-each select="pa:Result/pa:Results">
            <xsl:call-template name="result"></xsl:call-template>
    </xsl:for-each>
    
    </core:wrappedList>

  </xsl:template>

  <xsl:template name="tooManyHits">
    <core:listElement>
      <core:value xsi:type="retail:AddressListItem">
        <retail:addressDescription>
          <xsl:value-of select="$TOO_MANY_FLAG" />
        </retail:addressDescription>
        <retail:addressId xsi:type="xsd:string"
          xmlns:xsd="http://www.w3.org/2001/XMLSchema">
          <xsl:value-of select="$TOO_MANY_FLAG" />
        </retail:addressId>
      </core:value>
      <core:index>
        <xsl:value-of select="'0'" />
      </core:index>
    </core:listElement>
  </xsl:template>

  <xsl:template name="result">

    <xsl:variable name="descriptionString">
      <xsl:value-of select="pa:Text" />
    </xsl:variable>

    <core:listElement>
      <core:value xsi:type="retail:AddressListItem">
      <retail:addressDescription>
       <xsl:choose>
        <xsl:when test="pa:Next = 'Find'">
          <xsl:value-of select="pa:Text" />
          <xsl:text>, </xsl:text>
          <xsl:value-of select="pa:Description" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="pa:Text" />
        </xsl:otherwise>
      </xsl:choose>
        </retail:addressDescription>
        <retail:addressId xsi:type="xsd:string"
          xmlns:xsd="http://www.w3.org/2001/XMLSchema">
          <xsl:value-of select="pa:Id" />
        </retail:addressId>
        <xsl:choose>
        <xsl:when test="pa:Next = 'Find'">
          <retail:postCode xsi:type="xsd:string"
          xmlns:xsd="http://www.w3.org/2001/XMLSchema">
          <xsl:value-of select="pa:Text" />
        </retail:postCode>
        <retail:nextAction xsi:type="xsd:string"
          xmlns:xsd="http://www.w3.org/2001/XMLSchema">
          <xsl:value-of select="pa:Next" />
        </retail:nextAction>
        </xsl:when>
        </xsl:choose>
      </core:value>
      <core:index>
        <xsl:value-of select="(position() div 2) -1" />
      </core:index>
    </core:listElement>
  </xsl:template>

</xsl:stylesheet>