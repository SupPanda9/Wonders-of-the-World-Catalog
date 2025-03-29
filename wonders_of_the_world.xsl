<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="wonder">
    <div class="scene_container">
      <div class="scene">
        <div class="card">
          <div class="card__face card__face--front">
            <img class="card__image" src="{unparsed-entity-uri(images/image/image_src/@ent)}"/>         <!--Този ред се добавя към img в края, ако искате да се визулизират изображения 
                                                                                                        на Mozilla Firefox, тъй като layout engine-а на браузъра не поддържа XPATH 
                                                                                                        метода unparsed-entity-uri()-->
                                                                                                        <!--onerror="this.src='{images/image/image_src/@href}';"-->
            <div class="card__text_container">
              <div class="card__text">
                <p>Име</p>
                <xsl:value-of select="name"/>
                <br/>
                <xsl:value-of select="nickname"/>
                <p>Дестинация</p>
                <xsl:if test="destination/continent">
                  <xsl:value-of select="concat(destination/continent, '; ')"/>
                </xsl:if>
                <xsl:if test="destination/country">
                  <xsl:value-of select="concat(destination/country, '; ')"/>
                </xsl:if>
                <xsl:if test="destination/region">
                  <xsl:value-of select="concat(destination/region, '; ')"/>
                </xsl:if>
                <xsl:if test="destination/state">
                  <xsl:value-of select="concat(destination/state, '; ')"/>
                </xsl:if>
                <xsl:if test="destination/city">
                  <xsl:value-of select="concat(destination/city, '; ')"/>
                </xsl:if>
                <xsl:if test="destination/place">
                  <xsl:value-of select="destination/place"/>
                </xsl:if>
                <p>Работно време</p>
                <xsl:value-of select="accessibility/worktime"/>
                <p>Описание</p>
                <xsl:value-of select="description"/>
              </div>
            </div>
          </div>
          <div class="card__face card__face--back">
            <div class="card__text_container_back">
              <div class="card__text_back_1st_col">
                <p>История на създаването</p>
                <xsl:value-of select="history/creation"/>
                <p>Промени през годините</p>
                <xsl:value-of select="history/changes"/>
                <p>Достъпност</p>
                <xsl:value-of select="accessibility/transport"/>
              </div>
              <div class="card__text_back_2nd_col">
                <p>Цени на билети</p>
                <xsl:value-of select="accessibility/ticket_price"/>
                <p>Свързани чудеса</p>
                <xsl:for-each select="related_landmarks/landmark">
                  <ul>
                    <li><xsl:value-of select="."/></li>
                  </ul>
                </xsl:for-each>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="splitString">
    <xsl:param name="string"/>
    <xsl:choose>
      <xsl:when test="contains($string, ' ')">
        <xsl:if test="$string">
          <xsl:variable name="wonder" select="substring-before($string, ' ')"/>
          <xsl:apply-templates select="/catalog/wonders/wonder[@wonderId=$wonder]"/>

          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="substring-after($string, ' ')"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="wonder" select="$string"/>
        <xsl:apply-templates select="/catalog/wonders/wonder[@wonderId=$wonder]"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="wonders_of_the_world.css"/>
        <script>
          function showDiv(divId) {
            var divToShow = document.getElementById(divId);
            var otherDivs = ['1', '2', '3', '4'].filter(item => item !== divId);

            divToShow.style.display = 'block';
            otherDivs.forEach(otherDivId => {
              var otherDiv = document.getElementById(otherDivId);
              otherDiv.style.display = 'none';
            });
          }

          window.onload = function() {
            showDiv('1');
          };

          function toggleFooter() {
            const footer = document.getElementById('footer');
            const toggleButton = document.querySelector('.toggle-button');
            const toggleButtonContainer = document.querySelector('.toggle-button-container');

            if (footer.style.bottom === '0px') {
              footer.style.bottom = '-205px'; 
              toggleButtonContainer.style.bottom = '0px';
              toggleButton.innerHTML = '▲';
            } else {
              footer.style.bottom = '0px';
              toggleButtonContainer.style.bottom = '202px';
              toggleButton.innerHTML = '▼';
            }
          }
        </script>
      </head>
      <body>
        <h1>Каталог на Чудесата на света</h1>

        <div class="buttons">
          <button onclick="showDiv('1')">Сортиране по структурата на XML</button>
          <button onclick="showDiv('2')">Сортиране по континенти</button>
          <button onclick="showDiv('3')">Сортиране по тип на чудо</button>
          <button onclick="showDiv('4')">Сортиране по азбучен ред</button>
        </div>

        <xsl:variable name="Asia" select="/catalog/continents/continent_selector[@continentID='AS']"/>
        <xsl:variable name="Australia" select="/catalog/continents/continent_selector[@continentID='AU']"/>
        <xsl:variable name="Antarctica" select="/catalog/continents/continent_selector[@continentID='AN']"/>
        <xsl:variable name="Afrika" select="/catalog/continents/continent_selector[@continentID='AF']"/>
        <xsl:variable name="Europe" select="/catalog/continents/continent_selector[@continentID='EU']"/>
        <xsl:variable name="North_America" select="/catalog/continents/continent_selector[@continentID='NA']"/>
        <xsl:variable name="South_America" select="/catalog/continents/continent_selector[@continentID='SA']"/>

        <div id="1"> 
           <xsl:apply-templates select="/catalog/wonders/wonder"/>
        </div>
        
        <div class="continents" id="2">
          <h3><xsl:value-of select="$Asia/continent_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$Asia/@wonderRef1"/>
          </xsl:call-template>

          <h3><xsl:value-of select="$Australia/continent_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$Australia/@wonderRef1"/>
          </xsl:call-template>

          <h3><xsl:value-of select="$Antarctica/continent_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$Antarctica/@wonderRef1"/>
          </xsl:call-template>

          <h3><xsl:value-of select="$Afrika/continent_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$Afrika/@wonderRef1"/>
          </xsl:call-template>

          <h3><xsl:value-of select="$Europe/continent_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$Europe/@wonderRef1"/>
          </xsl:call-template>

          <h3><xsl:value-of select="$North_America/continent_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$North_America/@wonderRef1"/>
          </xsl:call-template>

          <h3><xsl:value-of select="$South_America/continent_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$South_America/@wonderRef1"/>
          </xsl:call-template>
        </div>

        <xsl:variable name="Natural" select="/catalog/types_of_wonders/type_of_wonder[@type_of_wonder_ID='NAW']"/>
        <xsl:variable name="New" select="/catalog/types_of_wonders/type_of_wonder[@type_of_wonder_ID='NW']"/>
        <xsl:variable name="Old" select="/catalog/types_of_wonders/type_of_wonder[@type_of_wonder_ID='OW']"/>

        <div class="types" id="3">
          <h3><xsl:value-of select="$Natural/type_of_wonder_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$Natural/@wonderRef2"/>
          </xsl:call-template>

          <h3><xsl:value-of select="$New/type_of_wonder_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$New/@wonderRef2"/>
          </xsl:call-template>

          <h3><xsl:value-of select="$Old/type_of_wonder_name"/>:</h3>
          <xsl:call-template name="splitString">
            <xsl:with-param name="string" select="$Old/@wonderRef2"/>
          </xsl:call-template>
        </div>

        <div id="4"> 
          <xsl:apply-templates select="/catalog/wonders/wonder">
            <xsl:sort select="name" order="ascending"/>
          </xsl:apply-templates>
        </div>
        
        <div class="toggle-button-container">
          <div class="toggle-button" onclick="toggleFooter()">
            ▲
          </div>
        </div>
        <footer class="footer" id="footer">
          <div class="footer-content">
            <p>Христина Гаджева - Ф№7MI0600131<br/>
            Николай Николаев - Ф№8MI0600010</p>
          </div>
        </footer>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
