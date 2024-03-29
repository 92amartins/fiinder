% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/find.R
\name{find}
\alias{find}
\title{Find good FII's (Brazilian Real Estate Funds)}
\usage{
find(n = 10, liq = 1000, min_p_vpa = 0.7, max_p_vpa = 1)
}
\arguments{
\item{n}{number of funds retrieved. Defaults to 10.}

\item{liq}{minimum stock liquidity. Defaults to 1000.}

\item{min_p_vpa}{minimum price/value relation. Defaults to 0.7.}

\item{max_p_vpa}{maximum price/value relation. Defaults to 1.0.}
}
\value{
data.frame of top funds.
}
\description{
Find good FII's (Brazilian Real Estate Funds)
}
\examples{
find()
}
