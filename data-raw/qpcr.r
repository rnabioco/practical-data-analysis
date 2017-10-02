library(tidyverse)
library(readxl)

qpcr <- read_excel('data-raw/qpcr.xlsx')
devtools::use_data(qpcr)

# Some test analyses
qpcr %>% spread(Sample, Cq)
