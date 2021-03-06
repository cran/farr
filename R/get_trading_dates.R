#' Produce a table mapping dates on CRSP to "trading days"
#'
#' Produce a table mapping dates on CRSP to "trading days".
#' Returned table has two columns: date, a trading date on CRSP;
#' td, a sequence of integers ordered by date.
#' See \code{vignette("wrds-conn", package = "farr")} for more on using this function.
#'
#' @param conn connection to a PostgreSQL database
#'
#' @return tbl_df
#' @export
#' @importFrom rlang .data
#' @examples
#' \dontrun{
#' library(DBI)
#' library(dplyr, warn.conflicts = FALSE)
#' pg <- dbConnect(RPostgres::Postgres())
#' get_trading_dates(pg) %>%
#'   filter(between(date, as.Date("2022-03-18"), as.Date("2022-03-31")))
#' }
get_trading_dates <- function(conn) {

    dsi <- dplyr::tbl(conn, dplyr::sql("SELECT * FROM crsp.dsi"))

    trading_dates <-
        dsi %>%
        dplyr::select(date) %>%
        dplyr::collect() %>%
        dplyr::arrange(date) %>%
        dplyr::mutate(td = dplyr::row_number())

    trading_dates
}
