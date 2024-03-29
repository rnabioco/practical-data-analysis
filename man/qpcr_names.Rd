% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.r
\docType{data}
\name{qpcr_names}
\alias{qpcr_names}
\title{Example qPCR data}
\format{
qPCR sample names in 96 well format.
}
\usage{
qpcr_names
}
\description{
Experimental variables include:
}
\details{
\itemize{
\item cell line (wt, mut)
\item gene (IFN, ACTIN)
\item time (0, 12, 24, 48)
\item reverse transcriptase (+, -)
\item replicate (1, 2, 3)
}

Varaibles are encoded in samples names: \code{cell_time_gene_rt_rep}.
}
\examples{
qpcr_names

}
\keyword{datasets}
