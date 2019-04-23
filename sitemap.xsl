<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="1.0">
  <xsl:output doctype-system="about:legacy-compat" method="html" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html>
      <head>
        <title>Sitemap</title>
        <meta charset='utf-8' />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <style type="text/css">
          .locationItem > a {
            font-weight: bold;
          }
        </style>
      </head>
      <body>
        <header>
          <h1>Sitemap</h1>
        </header>
        <article>
          <xsl:for-each select="sitemap:urlset/sitemap:url">
            <xsl:variable name="itemUrl">
              <xsl:value-of select="sitemap:loc"/>
            </xsl:variable>
            <xsl:variable name="itemText">
              <xsl:value-of select="substring-after(substring-after($itemUrl, '//'), '/')"/>
            </xsl:variable>
            <p class="locationItem">
              <a href="{$itemUrl}">
                <xsl:choose>
                  <xsl:when test="$itemText=''">
                    Home
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$itemText"/>
                  </xsl:otherwise>
                </xsl:choose>
              </a>
            </p>
          </xsl:for-each>
        </article>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>