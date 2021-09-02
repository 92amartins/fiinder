
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fiinder

<!-- badges: start -->
<!-- badges: end -->

Fiinder allows for simple access to good real estate funds.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
devtools::install_github("92amartins/fiinder")
```

## Usage

At the moment, fiinder is a single-function package. You can use
`fiinder::find` in order to get top brazilian real estate funds in terms
of dividend yield and price.

The most basic usage is to simply call the function with default
arguments and get the results back

``` r
library(fiinder)
fiinder::find()
#> # A tibble: 10 × 4
#>    `Códigodo fundo` `DY (12M)Média` `P/VPA` `Liquidez Diária`
#>    <chr>            <chr>           <chr>   <chr>            
#>  1 ARCT11           1,38%           0,99    2477.0           
#>  2 TORD11           0,97%           0,97    63425.0          
#>  3 PORD11           0,87%           0,95    7308.0           
#>  4 TGAR11           0,86%           0,98    29938.0          
#>  5 CPFF11           0,85%           0,99    9468.0           
#>  6 MFAI11           0,85%           0,87    1575.0           
#>  7 MFII11           0,83%           0,98    5275.0           
#>  8 PLCR11           0,82%           0,95    4321.0           
#>  9 VCJR11           0,82%           0,95    13933.0          
#> 10 EQIN11           0,80%           0,99    2498.0
```

Alternatively, you can specify the number of funds retrieved (`n`) and
other parameters such as stock liquidity (`liq`) minimum and maximum
price/value relations (`min_p_vpa` and `max_p_vpa` respectively).

``` r
fiinder::find(n=5, liq = 10000, min_p_vpa = 0.5, max_p_vpa = 1.2)
#> # A tibble: 6 × 4
#>   `Códigodo fundo` `DY (12M)Média` `P/VPA` `Liquidez Diária`
#>   <chr>            <chr>           <chr>   <chr>            
#> 1 HCTR11           1,47%           1,07    72535.0          
#> 2 RECR11           1,13%           1,11    41463.0          
#> 3 CVBI11           1,05%           1,01    31654.0          
#> 4 BCRI11           1,01%           1,02    12846.0          
#> 5 VGIP11           1,00%           1,06    18117.0          
#> 6 KNHY11           1,00%           1,07    11466.0
```
