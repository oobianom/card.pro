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
  htmltools::tags$div(class = "row card-pro-row", ...)
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
nav <- function(class,
                id = NULL,
                role = NULL,
                ...) {
  shiny::HTML(paste0(
    "<nav class='card-pro-nav ",
    class,
    "' id='",
    id,
    "' role='",
    role,
    "'>",
    ...,
    "</nav>"
  ))
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
template.loc <- function(template = "bundle") {
  file.path(find.package(package = .packageName), template)
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
#'   ui = fluidPage("Obi Obianom")
#'   shinyApp(ui = ui, server = empty.server)
#' }
#' @export
#'
empty.server <- function(input, output, session) {
}








#' Create a title and footer bar
#'
#' Create an alternative title bar
#'
#' @param title title of the tab
#' @param rightContent content of the right
#' @param windowTitle window title
#' @param bg.col background color
#' @param text.col text color
#'
#' @return An list containing the title and content of a header or footer
#' @rdname header-footer
#' @examples
#' if (interactive()) {
#' titlePanel2("Main title", "Right content | About me")
#' titlePanel2("Main title", action)
#' }
#'
#' @export
#'
titlePanel2 <- function(title, rightContent = NULL, windowTitle = title , text.col = "#2a2725", bg.col = "#ffffff") {
  htmltools::tags$header(id ="header", class = "cardpro-titlepanel", style = paste0("min-height: 70px;border-width:0!important;background:",bg.col,";color: ",text.col),
    shiny::h2(style="width: 100%;padding-left:10px",
      shiny::div(style="width: 100%; ",title, shiny::div(class="hidden-mobile hidden-tablet pull-right",rightContent))
    )
  )
}



#' @rdname header-footer
#' @examples
#' if (interactive()) {
#' footerPanel("Main footer @ 2024. All rights reserved", "Contact us")
#' }
#'
#' @export
#'
footerPanel <- function(title = shiny::HTML("&copy; 2024"), rightContent = NULL, bg.col = "#2a2725", text.col = "#f5f5f5") {
  htmltools::tags$div(class = "page-footer", style = paste0("background:",bg.col,";color: ",text.col),
                        shiny::div(title, shiny::div(class="hidden-mobile hidden-tablet pull-right",rightContent))
  )
}



#' Main panel to display content
#'
#' Customizable main panel for inclusion of various UI elements
#'
#' @param ... List of content
#' @param width Width of the main panel
#' @param border Should border be declared for the panel
#' @param shadow Should a shadow be added to the panel
#'
#' @note For more information on the features of the main panel, look through the Github examples
#' @return Creates a container for displaying contents
#'
#' @examples
#' \donttest{
#' primePanel("content 1")
#' }
#' @export

primePanel <- function(..., width = 8, border = FALSE, shadow = FALSE) {
  shiny::div(
    class = paste0("card-pro-prime p-0 m-0 col-12 col-md-", width),
    class = ifelse(border, "border", ""),
    class = ifelse(shadow, "shadow", ""),
    role = "main",
    ...
  )
}



#' New sidebar panel to display content
#'
#' Customizable sidebar panel for inclusion of various UI elements
#'
#' @param ... List of content
#' @param width Width of the sidebar panel
#' @param border Should border be declared for the panel
#' @param shadow Should a shadow be added to the panel
#'
#' @note For more information on the features of the sidebar panel, look through the Github examples
#' @return Creates an alternate container for displaying contents
#'
#' @examples
#' \donttest{
#' altPanel("content 2")
#' }
#' @export

altPanel <- function(..., width = 4, border = FALSE, shadow = FALSE) {
  htmltools::tags$div(
    class = paste0("col-12 col-md-", width),
    class = ifelse(border, "border", ""),
    class = ifelse(shadow, "shadow", ""),
    htmltools::tags$form(
      class = "well",
      role = "complementary", ...
    )
  )
}


#' A wrapper for panels
#'
#' Create a wrapper div for pannels
#'
#' @param ... div contents
#' @param bg background color of the wrapper
#'
#' @return a container for other containers
#'
#' @examples
#' wrapper(altPanel("hello"), shiny::mainPanel("test"))
#' wrapper(shiny::mainPanel("hello"), shiny::column(width = 2, "test"))
#' @export
#'

wrapper <- function(..., bg = c("default", "primary", "secondary", "warning", "info", "danger", "success")) {
  bg <- match.arg(bg)
  htmltools::tags$div(class = "xwrapper card-pro-wrapper", class = paste0("bg-", bg), ...)
}
