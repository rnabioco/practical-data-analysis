### Encode transcription factor data for 161 factors
### hg19
### additional info here:
### http://genome.ucsc.edu/cgi-bin/hgTables?db=hg19&hgta_group=regulation&hgta_track=wgEncodeRegTfbsClusteredV3&hgta_table=wgEncodeRegTfbsClusteredV3&hgta_doSchema=describe+table+schema


url <- "http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRegTfbsClustered/wgEncodeRegTfbsClusteredV3.bed.gz"

download.file(url,
              file.path("inst",
                        "extdata",
                        "wgEncodeRegTfbsClusteredV3.bed.gz"))
