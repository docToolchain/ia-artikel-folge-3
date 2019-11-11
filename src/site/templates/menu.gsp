<%
    //tag::map[]
    def nav = [
        title: 'Docs-as-Code',
        entries: [
          'Artikel': [
                  'Die Grundlagen': 'artikel/folge1',
                  'Die Werkzeuge': 'artikel/folge2',
                  'Alles unter einem Dach': 'artikel/folge3'
          ],
          'Architektur': [
                  '1. Einführung und Ziele': 'arc42/01_introduction_and_goals',
                  '2. Randbedingungen': 'arc42/02_architecure_constraints',
                  '3. Kontextabgrenzung': 'arc42/03_system_scope_and_context',
                  '4. Lösungsstrategie': 'arc42/04_solution_strategy',
                  '5. Bausteinsicht': 'arc42/05_building_block_view',
                  '6. Laufzeitsicht': 'arc42/06_runtime_view',
                  '7. Verteilungssicht': 'arc42/07_deployment_view',
                  '8. Querschnittliche Konzepte': 'arc42/08_concepts',
                  '9. Entwurfsentscheidungen': 'arc42/09_design_decisions',
                  '10. Qualitätsanforderungen': 'arc42/10_quality_scenarios',
                  '11. Risiken und technische Schulden': 'arc42/11_technical_risks',
                  '12. Glossar': 'arc42/12_glossary',
          ],
          'Tests': 'tests/',
          'News': 'news/',
          'About': 'about/',
        ]
    ]
    //end::map[]
/**
def nav = [
        title: 'Docs-as-Co.de',
        entries: [:]
]
System.err.println "processing menu"

published_pages.each { page ->
    def source = page.sourceuri
    def menu = source.split("/")[0]
    def item = source.split("/")[1].split("[.]")[0]
    if (!nav.entries[menu]) {
        nav.entries[menu] = [:]
    }
    nav.entries[menu][item]=menu+'/'+item
}
    **/
%>
	<!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%if (content.rootpath) {%>${content.rootpath}<% } else { %><% }%>">${nav.title}</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
              <% nav.entries.each { key, value -> %>
                <% if (value.class == String.class) { %>
                  <li><a href="<%if (content.rootpath) {%>${content.rootpath}<% } else { %><% }%>${value}${value.endsWith('/')?'':'.html'}">${key}</a></li>
                <% } else { %>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">${key}<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <% value.each { it -> %>
                        <li><a href="<%if (content.rootpath) {%>${content.rootpath}<% } else { %><% }%>${it.value}${it.value.endsWith('/')?'':'.html'}">${it.key}</a></li>
                      <% } %>
                    </ul>
                  </li>
                <% } %>
              <% } %>
          </ul>
            <!-- tag::search[] -->
            <form class="navbar-form navbar-right" action="https://google.de/search">
                <div class="form-group">
                    <input type="hidden" name="q" value="site:docs-as-co.de">
                    <input type="text" name="q" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <!-- end::search[] -->
        </div><!--/.nav-collapse -->
      </div>
    </div>
