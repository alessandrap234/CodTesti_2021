<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
  <html>
    <head>
      <title>Progetto Codifica di testi</title>
      <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"></xsl:value-of>
      <link href="stile.css" rel="stylesheet" type="text/css"/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
			<script src="progetto.js" type="text/javascript"></script>
    </head>
    <body>
    <div class = "main">
      <header>
        <h1><xsl:value-of select="//tei:title [@xml:lang='italian']"></xsl:value-of></h1>
        <nav>
          <ul>
            <li><a href = "#info">Informazioni</a></li>
            <li><a href = "#pag1">PAGINA 1</a></li>
            <li><a href = "#pag2">PAGINA 2</a></li>
            <li><a href = "#about">Crediti</a></li>
          </ul>
        </nav>
      </header>
      <div class = "boxpagina">
        <h2 id = "info">Informazioni sul manoscritto</h2>
        <div class = "boxsez">
            <div>
              <h3>Storia del manoscritto</h3>
              <p>Il manoscritto <b><xsl:value-of select="//tei:idno[@type='inventory']"></xsl:value-of></b> è stato realizzato da <b><xsl:value-of select="//tei:author[@xml:id='FdS']"></xsl:value-of></b>.</p>
              <xsl:value-of select="//tei:history"></xsl:value-of>
              <p>È possibile consultare il manoscritto presso l'Archivio online della <xsl:value-of select="//tei:publicationStmt/tei:publisher"></xsl:value-of> (<xsl:value-of select="//tei:licence"></xsl:value-of>).</p>
            </div>
            <div>
              <h3>Descrizione fisica</h3>
                <p><xsl:value-of select="//tei:supportDesc"></xsl:value-of></p>
                <xsl:value-of select="//tei:typeDesc"></xsl:value-of>
                <xsl:value-of select="//tei:langUsage"></xsl:value-of>
            </div>
        </div>
        <h2>Pagine del manoscritto</h2>
        <div class = "view">
          <label for="visualizza">Visualizza:</label>
          <select name="visualizza" id="visualizza">
            <option value="scegli">--</option>
            <option value="abbr">Abbreviazioni</option>
            <option value="del">Cancellature</option>
            <option value="date">Date</option>
            <option value="gap">Gaps</option>
            <option value="inst">Istituzioni</option>
            <option value="nomi">Nomi</option>
            <option value="term">Terminologia</option>
          </select>
          <span id = "terms_i">&#128214;</span>
        </div>
        <div class = "popup" id = "popup">
          <div class = "glossary">
          <h3>Termini e Definizioni</h3>
          <xsl:apply-templates select = "//tei:div[@type='addList']" />
          <button type = "button" id = "chiudi" name = "chiudi">Chiudi</button>
          </div>
        </div>
        <h3 id = "pag1">Prima Pagina</h3>
        <div class = "boxsez">
          <div class = "pic">
            <xsl:apply-templates select="//tei:surface[@xml:id='pag1']" />
          </div>
          <div class = "all_text">
            <div class = "fr_text" id = "fr_text1">
              <xsl:apply-templates select="//tei:body/tei:div[@n = '1']" />
            </div>
            <div class = "it_text" id = "it_text1">
              <xsl:apply-templates select="//tei:body/tei:div[@type = 'translation']/tei:ab[@corresp = '#P1_Prolusione']" />
            </div>
          </div>
        </div>
        <button type = "button" id = "traduci1">Traduci in italiano</button> 
        <button type = "button" id = "traduci1_fr">Traduci in francese</button> 
        <h3 id = "pag2">Seconda Pagina</h3>
        <div  class = "boxsez">
          <div class = "pic">
            <xsl:apply-templates select="//tei:surface[@xml:id='pag2']" />
          </div>
          <div class = "all_text">
            <div class = "fr_text" id = "fr_text2">
              <xsl:apply-templates select="//tei:body/tei:div[@n = '2']" />
            </div>
            <div class = "it_text" id = "it_text2">
              <xsl:apply-templates select="//tei:body/tei:div[@type = 'translation']/tei:ab[@corresp = '#P2_Prolusione']" />                            
            </div>
          </div>
        </div>
        <button type = "button" id = "traduci2">Traduci in italiano</button> 
        <button type = "button" id = "traduci2_fr">Traduci in francese</button> 
        <h2 id = "about">Crediti</h2>
        <footer class = "boxsez">
          <div>
            <h3><xsl:value-of select="//tei:edition"></xsl:value-of></h3>
            <b><xsl:value-of select="//tei:resp[@source='#Fadda']"></xsl:value-of></b>
            <xsl:value-of select="//tei:name[@ref='#EF']"></xsl:value-of>
            <br/>
            <b><xsl:value-of select="//tei:editionStmt/tei:respStmt/tei:resp"></xsl:value-of></b>
            <xsl:value-of select="//tei:name[@xml:id='AP']"></xsl:value-of>, <xsl:value-of select="//tei:name[@xml:id='MR']"></xsl:value-of>
          </div>
          <div>
            <h3>Fonti bibliografiche:</h3>
            <xsl:apply-templates select="//tei:listBibl" />
          </div>
        </footer>
        </div>
      </div>
    </body>
  </html>
</xsl:template>

<!-- Template per la gestione della trascrizione del testo -->
<xsl:template match="tei:lb">
  <br />
</xsl:template>

<!-- Template per la definizione delle immagini-->
<xsl:template match="tei:surface">
    <xsl:element name="img">
        <xsl:attribute name="id">
          <xsl:value-of select="concat(@xml:id, '_img')" />
        </xsl:attribute>
        <xsl:attribute name="src">
          <xsl:value-of select="concat(@xml:id, '.jpg')" />
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="concat('Foto ', @xml:id)" />
        </xsl:attribute>
        <xsl:attribute name="width">450px</xsl:attribute>
    </xsl:element>
</xsl:template>

<!--Template per la definizione delle opzioni di visualizzazione-->

<xsl:template match="//tei:ab//tei:gap | //tei:ab/tei:term | //tei:ab//tei:choice | //tei:ab//tei:expan | //tei:ab/tei:persName | //tei:ab//tei:institution | //tei:ab//tei:date | //tei:ab//tei:del">
  <xsl:element name="span">
    <xsl:choose>
      <xsl:when test="name() = 'gap'">
        <xsl:element name = "span">
          <xsl:attribute name="class">
            <xsl:value-of select="name()" />
          </xsl:attribute>
          <xsl:text>&#10008;</xsl:text>
        </xsl:element>
      </xsl:when>
      <xsl:when test="name() = 'persName'">
        <xsl:attribute name="class">
          <xsl:value-of select="name()" />
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="name() = 'institution'">
        <xsl:attribute name="class">
          <xsl:value-of select="name()" />
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="name() = 'choice'">
        <xsl:attribute name="class">
          <xsl:value-of select="name()" />
        </xsl:attribute>
      </xsl:when> 
      <xsl:when test="name() = 'expan'">
        <xsl:attribute name="class">
          <xsl:value-of select="name()" />
        </xsl:attribute>
        <xsl:attribute name="id">
          <xsl:value-of select="name()" />
        </xsl:attribute>
      </xsl:when> 
      <xsl:when test="name() = 'term'">
        <xsl:attribute name="class">
          <xsl:value-of select="name()" />
        </xsl:attribute>
      </xsl:when>       
      <xsl:when test="name() = 'date'">
        <xsl:attribute name="class">
          <xsl:value-of select="name()" />
        </xsl:attribute>
      </xsl:when> 
      <xsl:when test="name() = 'del'">
        <xsl:attribute name="class">
          <xsl:value-of select="name()" />
        </xsl:attribute>
      </xsl:when> 
    </xsl:choose>
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<!--Template per la visualizzazione delle definizioni dei termini-->
<xsl:template match = "//tei:div[@type='addList']">
  <xsl:for-each select = "//tei:item">
    <xsl:element name = "li">
      <xsl:value-of select="current()//tei:gloss" />  
    </xsl:element>
  </xsl:for-each>
</xsl:template>

<!-- Template per la definizione degli aspetti bibliografici -->
 <xsl:template match="tei:listBibl">
    <xsl:for-each select="current()/tei:bibl">
      <xsl:element name="li">
        <xsl:for-each select="current()//tei:author">
          <xsl:element name="span">
            <xsl:element name="b">
              <xsl:for-each select="current()//tei:forename">
                <xsl:apply-templates />
              </xsl:for-each>
              <xsl:text> </xsl:text>
              <xsl:for-each select="current()//tei:surname">
              	<xsl:apply-templates />
              </xsl:for-each>
            </xsl:element>
          </xsl:element>
          <xsl:text>, </xsl:text>
        </xsl:for-each>

        <xsl:element name="span">
          <xsl:element name="i">
            <xsl:for-each select="current()//tei:title">
              <xsl:apply-templates />
              <xsl:text>. </xsl:text>
            </xsl:for-each>
          </xsl:element>
        </xsl:element>

        <xsl:element name="span">
          <xsl:for-each select="current()//tei:pubPlace">
            <xsl:apply-templates />
            <xsl:text>, </xsl:text>
          </xsl:for-each>
        </xsl:element>

        <xsl:element name="span">
          <xsl:apply-templates select="current()//tei:date" />
          <xsl:text>. </xsl:text>
        </xsl:element>

      </xsl:element>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>