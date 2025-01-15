#' card.pro
#'
#' @name card.pro
#' @docType package
#' @noRd
#' @keywords internal
"_PACKAGE"

.onLoad <- function(libname,pkgname){
  utils::globalVariables(c("accordioniId"))
}



color.choice <- c( "redLight", "red","white", "green", "greenDark", "greenLight", "purple", "magenta", "pink", "pinkDark", "blueLight", "teal", "blue", "blueDark", "darken", "yellow", "orange", "orangeDark")
