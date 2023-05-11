<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"

    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:config="xalan://com.enactor.core.utilities.PropertyRegistry"
    xmlns:xalan="http://xml.apache.org/xslt"     
    xmlns:exslt="http://exslt.org/common"
    xmlns:java="http://xml.apache.org/xalan/java"
    xmlns:rjUtils="xalan://com.enactor.retailJInterface.utilities.RJUtils"
    extension-element-prefixes="config rjUtils"
    xmlns:retail="http://www.enactor.com/retail"
    xmlns:css="http://cssproductutilws"
    xmlns:orders="http://www.enactor.com/orders"
    xmlns:core="http://www.enactor.com/core"
   
    exclude-result-prefixes="xsl xsi xalan exslt orders">

    

<xsl:output method="xml" indent="yes"/>

<!--

    ##########################################################################

    Root Templates

    ########################################################################## 

  -->

<xsl:template match="json">

	<retail:elasticSearchResponse>
		<retail:responseId><xsl:value-of  select= "__id" /></retail:responseId>
		<retail:index><xsl:value-of  select= "__index" /></retail:index>	
		<retail:primaryTerm><xsl:value-of  select= "__primary_term" /></retail:primaryTerm>
		<retail:seqNo><xsl:value-of  select= "__seq_no" /></retail:seqNo>
		<retail:type><xsl:value-of  select= "__type" /></retail:type>
		<retail:version><xsl:value-of  select= "__version" /></retail:version>
		<retail:result><xsl:value-of  select= "result" /></retail:result>
		<retail:total><xsl:value-of  select= "___shards/total" /></retail:total>
		<retail:failed><xsl:value-of  select= "__shards/failed" /></retail:failed>
		<retail:successful><xsl:value-of  select= "__shards/successful" /></retail:successful>
	
	</retail:elasticSearchResponse>
	
</xsl:template>

</xsl:stylesheet>