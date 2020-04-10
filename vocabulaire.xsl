<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8"/>
<xsl:variable name="separator" select="'|'" />
<xsl:variable name="newline" select="'&#10;'" />

<xsl:template match="/">
<xsl:text>Jula,French,Speech,Hint,Example</xsl:text>
<xsl:value-of select="$newline" />

<xsl:for-each select="lexique/item">
  <xsl:value-of select="$separator" />
	<xsl:value-of select="jula"></xsl:value-of>
  <xsl:value-of select="$separator" />
	<xsl:for-each select="french/translations">
		<xsl:value-of select="definition"></xsl:value-of>
  	<xsl:value-of select="$separator" />
		<xsl:value-of select="speech/type"></xsl:value-of>
  	<xsl:value-of select="$separator" />
		<xsl:value-of select="speech/type/hint"></xsl:value-of>
  	<xsl:value-of select="$separator" />
		<xsl:value-of select="speech/example/jula"></xsl:value-of>
  	<xsl:value-of select="$separator" />
		<xsl:value-of select="speech/example/french"></xsl:value-of>
  	<xsl:value-of select="$separator" />
  	<xsl:value-of select="$newline" />
	</xsl:for-each>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>


	<!-- <xsl:apply-templates/> -->

