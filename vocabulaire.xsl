<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="lexique">
<xsl:text>Jula,French,Example
    </xsl:text>

			<xsl:for-each select="/item">
				<xsl:value-of select="target"/>,<xsl:value-of select="translation/definition"></xsl:value-of>
			</xsl:for-each>

<xsl:apply-templates/>

</xsl:template>
</xsl:stylesheet>


