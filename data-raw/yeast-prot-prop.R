library(tidyverse)

url <- 'https://downloads.yeastgenome.org/curation/calculated_protein_info/protein_properties.tab'
yeast_prot_prop <- read_tsv(url)

devtools::use_data(yeast_prot_prop, overwrite = TRUE)
