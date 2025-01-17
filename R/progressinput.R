#' Create simple progress bar
#'
#' Create a progress bar within card container
#'
#' @param id id of the container
#' @param label title of the progress bar
#' @param value value of the progress bar in percent
#' @param outer.value value shown next to title
#' @param color color of the progress bar
#' @param vertical if the progress bar should be vertical or horizontal
#' @param size size of progress bar
#' @param striped whether to show the progressed bar background as striped
#' @return an HTML content to display a progress bar
#'
#' @examples
#' if (interactive()) {
#' library(shiny)
#' library(card.pro)
#'
#' # Without much modification of defaults
#' progressInput(id="id1")
#'
#' # Set color and value
#' progressInput(id="id1", value = "90%", color = "green")
#' }
#' @export


progressInput <- function(id, label = "", value = "35%", outer.value = value, color = color.choice, vertical = FALSE, size = c("m","s","l"), striped = FALSE) {
  color = match.arg(color)
  size = match.arg(size)
  size = switch (size,"s" = "-sm", "m" = "", "l"="-lg")
  .cl = "progress progress"
  .cl2 = ""
  .wh = "width"
  #if vertical
  if(vertical){
    .cl = "progress vertical progress"
    .wh = "height"
  }
  #if striped
  if(striped).cl2 = " progress-striped"
  #create display
  shiny::tags$div(
    id = id,
    if(quickcode::not.empty(label)) shiny::tags$span(
      class = "text", label,
      shiny::tags$span(class = "pull-right", outer.value)
    ),
    shiny::tags$div(
      class = paste0(.cl,size,.cl2),
      shiny::tags$div(class = paste0("progress-bar bg-color-", color), `data-transitiongoal` = "1", `aria-valuenow` = "1", style = paste0(.wh,": ", value, ";"), value)
    )
  )
}
