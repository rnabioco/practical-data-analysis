### Encode transcription factor data for 161 factors
### hg19
### dropped all columns after name to save space
### additional info here:
### http://genome.ucsc.edu/cgi-bin/hgTables?db=hg19&hgta_group=regulation&hgta_track=wgEncodeRegTfbsClusteredV3&hgta_table=wgEncodeRegTfbsClusteredV3&hgta_doSchema=describe+table+schema


url <- "http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegTfbsClustered/wgEncodeRegTfbsClusteredV3.bed.gz"
tf_bed <- read_tsv(url, col_names = F)

out_file <- file.path("inst",
                      "extdata",
                      "wgEncodeRegTfbsClusteredV3.bed")

write_tsv(tf_bed[, 1:4], out_file, col_names = F)
R.utils::gzip(out_file, overwrite = T)
