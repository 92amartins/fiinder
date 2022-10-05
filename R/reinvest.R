#' Find the best reinvestment opportunities
#'
#' `reinvest` takes a list of assets stored in `assets.yaml` and
#' returns the best reinvestment opportunities at the moment.
#'
#' @param criteria reinvestment criteria. "dividend" or "price"
#'
#' @return assets sorted according to the reinvestment criteria.
#'
#' @import yaml
#' @import dplyr
#'
#' @export
#'
#' @examples
#' reinvest()
reinvest <- function(criteria="dividend"){
  assets = load_assets()
  df = fetch()

  sorted_assets <- df %>%
    dplyr::filter(`Códigodo fundo` %in% assets) %>%
    dplyr::select(`Códigodo fundo`,`DY (12M)Média`, `P/VPA`, `Preço Atual`, `Liquidez Diária`) %>%
    dplyr::arrange(desc(`DY (12M)Média`))

  if(criteria == "price"){
    sorted_assets <- sorted_assets %>%
      dplyr::arrange(desc(`P/VPA`))
  }

  sorted_assets
}

load_assets <- function(){
  tryCatch(
    expr = {
      config = yaml::yaml.load_file("assets.yaml")
      assets = config$assets
      assets
    },
    error = function(e) stop("Did you specify assets in assets.yaml?")
  )
}
