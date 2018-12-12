
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE56nnn/GSE56977/suppl/GSE56977_rates_gene.tx.txt.gz",
              "tx_rates.txt.gz")

dat <- read_tsv("tx_rates.txt.gz", skip = 1, col_names = F)

col_ids <- c(
  "gene", 
  "quantile"
)

other_col_ids <- paste("rate at", seq(0, 180, by = 15))

new_col_ids <- c(col_ids, other_col_ids)

colnames(dat) <- new_col_ids


## tidy data into matrix
## drop quantile 
dat %>% select(-quantile)
dat[, -2]

dat <- dat %>% select(-quantile)

tx_rates <- dat %>% as.data.frame() %>% 
  column_to_rownames("gene") %>% 
  as.matrix()


usethis::use_data(tx_rates, overwrite = TRUE, compress = "xz")
