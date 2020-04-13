<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8"/>
<xsl:strip-space elements="*"/>
<xsl:variable name="separator" select="','" />
<xsl:variable name="newline" select="'&#10;'" />

	<xsl:template match="/">
		<xsl:text>Jula,French,Speech,Hint,Example</xsl:text>
		<xsl:for-each select="/lexique/item">
			<xsl:value-of select="jula"></xsl:value-of>
  		<xsl:text select=","/>
			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>


	<!-- <xsl:apply-templates/> -->

