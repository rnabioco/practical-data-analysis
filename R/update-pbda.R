#' Update pbda package using devtools
#'
#' @param repo repository to update
#' @param ... additional arguments to pass to devtools::install_github()
#'
#' @examples
#' \dontrun{
#' update_pbda()
#' }
#' @export
update_pbda <- function(repo = "rnabioco/practical-data-analysis", ...){
  devtools::install_github(repo, ...)
}
