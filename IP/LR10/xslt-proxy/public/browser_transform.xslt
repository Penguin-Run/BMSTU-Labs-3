<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
  <!-- <xsl:template match="/objects"> -->
    <html>
      <body>
        <h2>Execution sequance</h2>
      
          <table border="1">
            <tr>
              <th>Position</th>
              <th>Element</th>
              <th>Status</th>
            </tr>
            <xsl:for-each select="/objects/object">
              <xsl:variable name="counter" select="position()"/>
              <tr>
                <td><xsl:value-of select="$counter"/></td>
                <td><xsl:value-of select="element"/></td>
                <td><xsl:value-of select="status"/></td>
              </tr>
            </xsl:for-each>
          </table>
        <!-- </xsl:template>
        <xsl:template match = "/hash">
          <p><xsl:value-of select="hash/message"/></p>
        </xsl:template>
 -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>