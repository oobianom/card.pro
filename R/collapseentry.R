#' Create a collapsible container panel item
#'
#' Create a collapsible container panel item that is enclosed by a list
#'
#' @param title title of the collapsible container
#' @param collapsed whether the panel is collapsed or not
#' @param color.on color of collapsible icon when hover on
#' @param color.off color of collapsible icon when hover off
#' @param ... content of the collapsible container
#'
#' @return An list containing the title and content of a collapsible container
#' @details
#' Get color choices using quickcode:::color.choice
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(card.pro)
#'  card.pro(
#'   title = "Sample collapsible",width = 4,
#'   collapsibleGroup = list(
#'     collapseEntry(title = "Summary 1", collapsed = TRUE, "Convallis aesus."),
#'     collapseEntry(title = "Summary 2", "eiusmod tempor incididunt")
#'   )
#' )
#' }
#'
#' @export
#'
#'
collapseEntry <- function(...,title, collapsed = FALSE, color.off = "darken", color.on = "red") {
  unit <- quickcode::number(1, max.digits = 4)
  .colin <- ifelse(collapsed," in","")
  .colin2 <- ifelse(collapsed,"","collapsed")
  list(shiny::tags$div(
    class = "panel panel-default",
    shiny::tags$div(
      class = "panel-heading",
      shiny::tags$h4(
        class = "panel-title",
        shiny::tags$a(
          href = paste0("#collapse-",unit),
          `data-toggle` = "collapse",
          `data-parent` = paste0("#accordion-",options()$cardproaccordioniId),
          class = .colin2,
          shiny::tags$i(class = paste0(
            "fa fa-fw fa-plus-circle txt-color-", color.off
          )),
          shiny::tags$i(class = paste0(
            "fa fa-fw fa-minus-circle txt-color-", color.on
          )),
          title
        )
      )
    ),
    shiny::tags$div(
      id = paste0("collapse-",unit),
      class = paste0("panel-collapse collapse",.colin),
      shiny::tags$div(class = "panel-body", ...)
    )
  ))
}
