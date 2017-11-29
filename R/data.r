#' Example qPCR data
#'
#' Experimental variables include:
#'
#' - cell line (wt, mut)
#' - gene (IFN, ACTIN)
#' - time (0, 12, 24, 48)
#' - reverse transcriptase (+, -)
#' - replicate (1, 2, 3)
#'
#' Varaibles are encoded in samples names: `cell_time_gene_rt_rep`.
#'
#' @format qPCR sample names in 96 well format.
#'
#' @examples
#' qpcr_names
#'
"qpcr_names"

#' Names of example qPCR data
#'
#' Relative expression levels for each sample.
#'
#' @format qPCR sample data in 96 well format.
#'
#' @examples
#' qpcr_data
#'
"qpcr_data"

#' mtcars in tibble format
#'
#' @examples
#' mtcars_tbl
#'
"mtcars_tbl"
