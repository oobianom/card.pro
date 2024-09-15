#' Generate a flexible and extensible card container
#'
#' Widely used card component from Bootstrap with improvements to improve utility
#'
#' @param ... The elements to include within the body of the card
#' @param title The text to display in the header title
#' @param collapsed If \code{TRUE}, the card is collapsed. The default is \code{FALSE}
#' @param bg.fade If \code{TRUE}, the background will be faded if a background exists
#' @param width Select a width from 1 to 12 to indicate the size of the card
#' @param header.bg Header background color style
#' @param alert.text Enter text for the alert portion. Leave as NULL to exclude the alert
#' @param alert.type Indicate the type of alert to include, choices are "warning", "info", "success", "danger"
#' @param tabs optional. A list containing tabs items, see example
#' @param icon Header icon e.g. shiny::icon('fire')
#' @param xtra.header.content additional header content e.g. "Hi"
#' @param footer Footer content if any
#' @param togglebtn show toggle button
#' @param editbtn show header title edit button
#' @param expandbtn show card expand button
#' @param colorbtn show header color chooser
#' @param removebtn show card closer button
#' @param sortable If \code{FALSE}, the card will not be draggable
#' @param sidebar optional. include side bar content
#'
#' @note For more information on the features of the card, visit the examples section of the help documentation
#' @return HTML code of the container with a class called card.pro that holds the items
#'
#' @examples
#'
#' # Example 1
#' if (interactive()) {
#'   library(shiny)
#'   library(card.pro)
#'
#'   shiny::shinyApp(
#'     ui = fluidPage(
#'       style = "4",
#'       custom.bg.color = "lightblue",
#'       sidebar = NULL,
#'       header = titlePanel(left = "Card Ex2"),
#'       wrapper(
#'         altPanel(
#'           card.pro(
#'             title = "Standard card",
#'             collapsed = TRUE,
#'             alert.text = "An alert2 for the content",
#'             alert.bg = "warning",
#'             toolbar = list(
#'               collapse = TRUE,
#'               maximize = TRUE,
#'               close = FALSE,
#'               menu = TRUE
#'             ),
#'             shiny::h3("Sample text"),
#'             "Lorem ipsum dolor sit a"
#'           )
#'         ),
#'         mainPanel(
#'           card(
#'             title = "Standard card 2",
#'             shiny::h1("Sample text"),
#'             "Lorem ipsum dolor sit a"
#'           )
#'         )
#'       )
#'     ),
#'     server = function(input, output) {
#'     }
#'   )
#' }
#'
#' # Example 2
#' if (interactive()) {
#'   library(shiny)
#'   library(card.pro)
#'
#'   shiny::shinyApp(
#'     ui = fluidPage(
#'     titlePanel(left = "Card Ex1"),
#'       wrapper(
#'         altPanel(
#'           width = 12,
#'           card(
#'             title = "Standard card",
#'             alert.text = "An alert1 for the content",
#'             shiny::h3("Sample text"),
#'             "Lorem ipsum dolor sit a"
#'           ),
#'           card.pro(
#'             title = "Standard card",
#'             collapsed = TRUE,
#'             alert.text = "An alert2 for the content",
#'             alert.type = "warning",
#'             shiny::h3("Sample text"),
#'             "Lorem ipsum dolor sit a"
#'           )
#'         )
#'       )
#'     ),
#'     server = function(input, output) {
#'     }
#'   )
#' }
#'
#' @export
card.pro <- function(..., title,  collapsed = FALSE, width = 12, tabs = NULL, icon = NULL, xtra.header.content = NULL, footer = NULL,
                     togglebtn = TRUE, editbtn = TRUE, expandbtn = TRUE, colorbtn = TRUE, removebtn = TRUE, sortable = TRUE, sidebar = NULL,
                     header.bg = c("white", "green", "greenDark", "greenLight", "purple", "magenta", "pink", "pinkDark", "blueLight", "teal", "blue", "blueDark", "darken", "yellow", "orange", "orangeDark", "red", "redLight"), alert.text = NULL, alert.type = c("warning", "info", "success", "danger")) {
  header.bg <- match.arg(header.bg)

  nulltabs <- !is.null(tabs)
  inheritstabs <- inherits(tabs, "list") & length(tabs)
  gnum <- quickcode::number(1)

  final.div <- htmltools::tags$div(
    id = paste0("wid-id-", gnum),
    class = "jarviswidget",
    class = paste0("jarviswidget-color-", header.bg),
    htmltools::tags$header(
      htmltools::tags$h2(icon, title),
      if (!is.null(xtra.header.content)) htmltools::tags$div(class = "widget-toolbar", xtra.header.content),
      if (nulltabs) {
        if (inheritstabs) {
          htmltools::tags$ul(
            class = "nav nav-tabs pull-right in",
            lapply(quickcode::indexed(tabs), function(l) {
              htmltools::tags$li(
                class = ifelse(l$key == 1, "active", ""),
                htmltools::tags$a(`data-toggle` = "tab", href = paste0("#tablend-", l$value$unit, "-", l$key), l$value$title)
              )
            })
          )
        }
      }
    ),
    # main body
    htmltools::tags$div(
      class = "no-padding",
      htmltools::tags$div(
        class = "jarviswidget-editbox",
        htmltools::tags$div(
          htmltools::tags$label("Title"),
          htmltools::tags$input(type = "text")
        )
      ),
      if (!is.null(alert.text)) {
        htmltools::tags$div(
          class = paste0("alert alert-", alert.type, " fade in"), style = "border-radius: 0!important;border-width: 1px 0;border-color: #ccc;",
          htmltools::tags$button(class = "close", `data-dismiss` = "alert", "×"),
          alert.text
        )
      },
      htmltools::tags$div(
        class = "widget-body widget-hide-overflow",
        if (!is.null(sidebar)) {
          htmltools::tags$div(
            id = "chat-container",
            htmltools::tags$span(class = "chat-list-open-close", style="padding-top: 7px;", htmltools::tags$i(class = "fa fa-cog")),
            htmltools::tags$div(class = "chat-list-body custom-scroll padding-10", sidebar)
          )
        },
        htmltools::tags$div(class = "padding-15", ...),
        if (nulltabs) {
          if (inheritstabs) {
            htmltools::tags$div(
              id = "myTabContent", class = "tab-content",
              lapply(quickcode::indexed(tabs), function(l) {
                htmltools::tags$div(class = ifelse(l$key == 1, "tab-pane fade active in padding-10 no-padding-bottom", "tab-pane fade"), id = paste0("tablend-", l$value$unit, "-", l$key), htmltools::tags$div(class = "padding-15", l$value$content))
              })
            )
          }
        }
      ),
      if(!is.null(footer)){
      htmltools::tags$div(class="chat-footer padding-top-10",footer)
      }
    )
  )

  if (!togglebtn) final.div$attribs$`data-widget-togglebutton` <- "false"
  if (!editbtn) final.div$attribs$`data-widget-editbutton` <- "false"
  if (!expandbtn) final.div$attribs$`data-widget-fullscreenbutton` <- "false"
  if (!colorbtn) final.div$attribs$`data-widget-colorbutton` <- "false"
  if (!removebtn) final.div$attribs$`data-widget-deletebutton` <- "false"
  if (collapsed) final.div$attribs$`data-widget-collapsed` <- "true"
  if (!sortable) final.div$attribs$`data-widget-sortable` <- "true"

  htmltools::tags$article(
    htmltools::tags$span(style = "display:none", shiny::icon("fire")),
    class = paste0("col-12 col-md-", width),
    final.div
  )
}


#' Generate a moveable grid
#'
#' A grid that holds draggable items
#'
#' @param ... The elements to include within the body of the moveable grid
#'
#' @note For more information on the features of a sortable grid, visit the examples section of the help documentation
#' @return HTML code of a container that allows items within it to be draggable
#'
#' @examples
#' moveable(
#'   htmltools::tags$div("A"),
#'   htmltools::tags$div("B")
#' )
#' @export

moveable <- function(...) {
  shiny::tags$section(id = "cardpro-widget-grid", shiny::div(class = "row", ...))
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
    class = paste0("col-12 col-md-", width),
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

altPanel <- function(..., width = 6, border = FALSE, shadow = FALSE) {
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
  htmltools::tags$div(class = "xwrapper", class = paste0("bg-", bg), ...)
}
