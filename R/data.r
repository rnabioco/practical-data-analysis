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

#' Gene expression in yeast measured by microarray
#'
#' A dataset containing gene expression values of Saccharomyces cerevisiae grown
#' under nutrient limitation conditions. The variables are as follows:
#'
#' - `name` Common gene name
#' - `BP` Gene Ontology Biological Process
#' - `MF` Gene Ontology Molecular Function
#' - `systematic_name` Systematic gene name
#' - `nutrient` Nutrient omitted for growth
#' - `rate` Growth rate
#' - `expression` Gene expression value
#'
#' @format A data frame with 198,430 observations of 7 variables.
#'
#' @source \url{http://www.molbiolcell.org/content/19/1/352.long}
#' @source \url{http://varianceexplained.org/r/tidy-genomics/}
#' @source \url{http://varianceexplained.org/r/tidy-genomics-broom/}
"brauer_gene_exp"

#' Properties of yeast proteins
#'
#' A dataset containing physical parameters of yeast proteins.``
#'
#' @source \url{https://downloads.yeastgenome.org/curation/calculated_protein_info/protein_properties.tab}
"yeast_prot_prop"

#' Sample missing data
#'
#' A dataset for exploring missing data.
#'
"missing_ex"

#' Microarray data from the NCI-60 cancer cell line panel
#'
#' See ?ISLR::NCI60 for description of dataset.
#' 
#' @format matrix with 6830 rows and 64 columns containing
#' normalized gene expression values.
#'
#'@source ISLR::NCI60
#' @examples
#' nci60
#'
"nci60"

#' Transcription rates for ~7000 genes measured across a timecourse
#'
#' Mouse dendritic cells were stimulated with LPS, and timepoints were 
#' collected every 15 minutes. Metabolic labeling pulse with 4sU was performed
#' 10 minutes prior to collection. Total RNA and 4sU containing RNA was collected 
#' and used to calculate transcription rates.
#' 
#' @format matrix with 7872 genes as rows and 13 columns containing
#' transcription rates.
#'
#' @source \url{https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE56977}
#' @source \url{https://www.ncbi.nlm.nih.gov/pubmed/25497548}
#' @examples
#' tx_rates
#'
"tx_rates"


#' single cell RNA-seq dataset of mouse embryonic development
#'
#' A scRNA-seq dataset of developing mouse embryos generated with Smart-Seq2
#' @format matrix with 22431 genes as rows and 268 cells as columns containing
#' raw read counts.
#'
#' @examples
#' esc_mat
#'
"esc_mat"

#' Example matrix to highlight clustering methods
#'
#' @format matrix with 4 rows and 8 columns 
#'
#' @examples
#' clust_mat
#'
"clust_mat"