#' Generate a row div
#'
#' A simple row div
#'
#' @param ... The elements to include within the body of the row
#'
#' @return An HTML containing elements of a container with class row to be embedded in a page
#' @examples
#' row(shiny::div(width=12,"Hello nextGenShinyApps"))
#' @export
#'
row <- function(...) {
  div(class = "row", ...)
}


#' Include stylesheets and scripts
#'
#' Use the package scripts and stylesheets in a page
#'
#' @param template The template type
#' @param jquery option. logical. include jquery
#' @param jqueryui option. logical. include jquery UI
#' @param fontawesome option. logical. include fontawesome
#'
#' @return A list of files to be inserted in the header of a page
#' @examples
#' use.cardpro('core')
#' @export
#'
use.cardpro <- function(template = "bundle", jquery = FALSE, jqueryui = TRUE, fontawesome = TRUE){
  p.v = 2.1
  j = ju = fa = NULL
  if(jquery)j = "opt/jquery-3.7.1.min.js"
  if(jqueryui)ju = "opt/jquery-ui.min.js"
  if(fontawesome)fa = "opt/font-awesome.min.css"
  icon("cog")
  list(
  htmltools::htmlDependency(
    .packageName, p.v,
    src = template.loc(template),
    script = c(j,ju,paste0("req/",list.files(template.loc(file.path(template,"req")),pattern = ".js$"))),
    stylesheet = c(fa,paste0("req/",list.files(template.loc(file.path(template,"req")),pattern = ".css$"))),
    all_files = TRUE
  ))
}

#' Nav tag
#'
#' A nav tag for creating HTML navigations
#'
#' @param class The class of the navigation container
#' @param id The identification of the navigation container
#' @param role The character role of the container on the page
#' @param ... The content of the container
#'
#' @return HTML content of a container with type nav
#' @examples
#' nav('sample','id1','sample','some content')
#' @export
#'
nav <- function(class, id = NULL, role = NULL, ...) {
  shiny::HTML(paste0("<nav class='", class, "' id='", id, "' role='", role, "'>", ..., "</nav>"))
}


#' Template location full text
#'
#' Fetch the location of the scripts
#'
#' @param template The type of template to fetch
#'
#' @return A path for the location of the package
#' @examples
#' template.loc('bundle')
#' @export
#'
template.loc <- function(template = "bundle"){
  file.path(find.package(package = "card.pro"),template)
}


#' Empty server function
#'
#' For use in simple shiny apps not requiring server functions
#'
#' @param input the input object
#' @param output the output object
#' @param session the session object
#'
#' @return Empty server function
#' @examples
#' if(interactive()){
#'   library(shiny)
#'   library(card.pro)
#'   ui = fluidPage()
#'   shinyApp(ui = ui, server = empty.server)
#' }
#' @export
#'
empty.server <- function(input, output, session) {}



#' Create a tab panel item
#'
#' Create a tab panel item that is enclosed by a list
#'
#' @param title title of the tab
#' @param ... content of the tab
#'
#' @return An list containing the title and content of a tab
#'
#' @examples
#' if (interactive()) {
#' tabEntry("Summary", "Convallis aesus.")
#' tabEntry("Summary", "nextGenShinyApps.")
#' }
#'
#' @export
#'
#'
tabEntry <- function(title, ...) {
  list(unit = quickcode::number(1,max.digits = 4), title = title, content = htmltools::div(...))
}
