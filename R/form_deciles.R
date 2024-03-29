get_deciles <- function(x) {
  breaks <- stats::quantile(x, probs = seq(from = 0, to = 1, by = 0.1),
                            na.rm = TRUE)
  breaks[length(breaks)] <- Inf
  list(breaks)
}

#' Form deciles
#'
#' Calculate deciles for a variable.
#'
#' @param x A vector for which deciles are to be calculated.
#'
#' @return vector
#' @export
#' @examples
#' library(farr)
#' library(dplyr, warn.conflicts = FALSE)
#'
#' df <-
#'     tibble(x = rnorm(100)) %>%
#'     mutate(dec_x = form_deciles(x))
#' df
form_deciles <- function(x) {
  cuts <- get_deciles(x)
  cut(x, cuts[[1]], labels = FALSE, include.lowest = TRUE)
}

