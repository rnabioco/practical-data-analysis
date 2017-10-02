library(tidyverse)
library(stringr)
library(readxl)

qpcr <- read_excel('data-raw/qpcr.xlsx')
names(qpcr) <- names(qpcr) %>% str_to_lower()
devtools::use_data(qpcr, overwrite = TRUE)

# Some test analyses
qpcr %>% spread(sample, cq)
