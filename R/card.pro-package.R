#' card.pro
#'
#' @name card.pro
#' @docType package
#' @noRd
#' @keywords internal
"_PACKAGE"

.onLoad <- function(libname,pkgname){
  utils::globalVariables(c("graphics.off","vali", "sd", "x",'pattern','replacement'))
}

