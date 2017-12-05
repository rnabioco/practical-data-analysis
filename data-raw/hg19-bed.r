library(valr)
library(tidyverse)
library(R.utils)

ucsc <- db_ucsc('hg19')
ref_flat <- tbl(ucsc, "refFlat")
ref_flat <- collect(ref_flat)

ref_bed <- ref_flat %>%
  select(chrom, txStart, txEnd, geneName, exonCount, strand) %>%
  mutate_if(is.numeric, as.integer) %>% #to prevent 1e6 printing of dbls
  unique()

write_tsv(ref_bed,
          file.path("inst", "extdata", "hg19_genes.bed"),
          col_names = F)

R.utils::gzip(file.path("inst", "extdata", "hg19_genes.bed"),
              overwrite = T)

genome <- tbl(ucsc, "chromInfo")
genome <- collect(genome)
genome <- select(genome, -fileName)
write_tsv(genome,
          file.path("inst", "extdata", "hg19_genome.txt"),
          col_names = F)

R.utils::gzip(file.path("inst", "extdata", "hg19_genome.txt"),
              overwrite = T)
