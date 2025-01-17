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
#' card.pro(
#'   title = "Sample tabs",
#'   tabs = list(
#'     tabEntry("Summary", "Convallis aesus."),
#'     tabEntry("Summary", "nextGenShinyApps.")
#'   )
#' )
#' }
#'
#' @export
#'
#'
tabEntry <- function(title, ...) {
  list(
    unit = quickcode::number(1, max.digits = 4),
    title = title,
    content = htmltools::div(...)
  )
}
