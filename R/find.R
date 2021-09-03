#' Find good FII's (Brazilian Real Estate Funds)
#'
#' @param n number of funds retrieved. Defaults to 10.
#' @param liq minimum stock liquidity. Defaults to 1000.
#' @param min_p_vpa minimum price/value relation. Defaults to 0.7.
#' @param max_p_vpa maximum price/value relation. Defaults to 1.0.
#'
#' @return data.frame of top funds.
#'
#' @import xml2
#' @import rvest
#' @import dplyr
#'
#' @export
#'
#' @examples
#' find()
find <- function(n=10, liq=1000, min_p_vpa=0.7, max_p_vpa=1){
  URL <- "https://www.fundsexplorer.com.br/ranking"
  page = xml2::read_html(URL)

  df = rvest::html_node(page, "#table-ranking") %>%
    rvest::html_table()

  df %>%
    dplyr::filter(`DY (12M)Média` != "N/A" & `P/VPA` != "N/A") %>%
    dplyr::filter(as.integer(`Liquidez Diária`) > liq) %>%
    dplyr::filter((gsub(",", ".", `P/VPA`) >= min_p_vpa) & (gsub(",", ".", `P/VPA`) <= max_p_vpa)) %>%
    dplyr::arrange(desc(`DY (12M)Média`)) %>%
    dplyr::select(`Códigodo fundo`,`DY (12M)Média`, `P/VPA`, `Preço Atual`, `Liquidez Diária`) %>%
    dplyr::top_n(n, `DY (12M)Média`)
}
