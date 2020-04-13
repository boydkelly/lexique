<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- IdentityTransform -->
  <xsl:template match="/ | @* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="/lexique/item/french/translations/speech/example/jula">
    <source>
      <xsl:apply-templates select="@* | node()"/>
    </source>
  </xsl:template>
  <xsl:template match="/lexique/item/french/translations/speech/example/french">
    <target>
      <xsl:apply-templates select="@* | node()"/>
    </target>
  </xsl:template>
</xsl:stylesheet>
