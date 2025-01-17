#' Include stylesheets and scripts
#'
#' Use the package scripts and stylesheets in a page
#'
#' @param theme The template type
#' @param template template folder
#' @param jquery option. logical. include jquery
#' @param jqueryui option. logical. include jquery UI
#' @param fontawesome option. logical. include fontawesome
#' @param fix.header logical. fix header if titlePanel2() is used in UI
#'
#' @note
#' Theme options are "a", "b", "c", "d" or "e"
#'
#' @return A list of files to be inserted in the header of a page
#' @examples
#' if(interactive()){
#' use.cardpro()
#' use.cardpro(theme="a",jqueryui = TRUE, fontawesome = FALSE)
#' }
#' @export
#'
use.cardpro <-
  function(theme = letters[1:5],
           jquery = FALSE,
           jqueryui = TRUE,
           fontawesome = FALSE,
           template = "bundle",
           fix.header = FALSE
  ) {
    fxhdr = ifelse(fix.header," fixed-header","")
    p.v = 2.1
    j = ju = fa = NULL
    if (jquery)
      j = "opt/jquery-3.7.1.min.js"
    if (jqueryui)
      ju = "opt/bjquery-ui.min.js"
    theme = match.arg(theme)
    list(
      htmltools::tags$script(
        paste0(
          "document.body.className = document.body.className+'",fxhdr," fixed-page-footer smart-style-",
          switch (
            theme,
            a = "1';",
            b = "6';",
            c = "2';",
            d = "3';",
            e = "4';"
          )
        )
      ),
      if(file.exists("www/myscript.js")){htmltools::tags$script(src="myscript.js")},
      if(file.exists("www/myscript.css")){htmltools::tags$link(rel="stylesheet", type="text/css", href="myscript.css")},
      htmltools::tags$link(
        href = ifelse(
          fontawesome,
          "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/fontawesome.min.css",
          ""
        )
      ),
      htmltools::htmlDependency(
        .packageName,
        p.v,
        src = template.loc(template),
        script = c(j, ju, paste0(
          "req/", list.files(template.loc(file.path(template, "req")), pattern = ".js$")
        )),
        stylesheet = c(paste0(
          "req/", list.files(template.loc(file.path(template, "req")), pattern = ".css$")
        ))
      )
    )
  }
