#' Fetch all FII's (Brazilian Real Estate Funds)
#'
#' @return data.frame of all fii's.
#'
#' @import xml2
#' @import rvest
#'
#' @export
#'
#' @examples
#' fetch()
fetch <- function(){
  URL <- "https://www.fundsexplorer.com.br/ranking"
  page = xml2::read_html(URL)

  df = rvest::html_node(page, "#table-ranking") %>%
    rvest::html_table()
  df
}
