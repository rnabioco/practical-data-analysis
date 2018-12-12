library(tidyverse)
library(ISLR)

nci60 <- t(NCI60$data)
ids <- tibble(type = NCI60$labs) %>% 
  group_by(type) %>% 
  mutate(id = row_number(), 
         id = str_c(type, "_", id)) %>% 
  pull(id)

colnames(nci60) <- ids  
rownames(nci60) <- str_c("gene_", rownames(nci60))

usethis::use_data(nci60, overwrite = TRUE, compress = "xz")
