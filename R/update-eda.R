#' Update eda package using devtools
#'
#' @param repo repository to update
#' @param ... additional arguments to pass to devtools::install_github()
#'
#' @examples
#' \dontrun{
#' update_eda()
#' }
#' @export
update_eda <- function(repo = "IDPT7810/practical-data-analysis", ...){
  devtools::install_github(repo, ...)
}
