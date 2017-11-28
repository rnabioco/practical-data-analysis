library(tidyverse)
library(readxl)
library(magrittr)

qpcr <- read_excel('data-raw/qpcr.xlsx')

names(qpcr) %<>% str_to_lower()

qpcr %<>% mutate(cq = as.numeric(cq))
devtools::use_data(qpcr, overwrite = TRUE)

# simulate qpcr data ----------------------------

sample <- c('WT', 'KO')
gene <- c('ACTIN', 'IFN')
rep <- 1:3
RT <- c('+', '-')

samples <- tidyr::crossing(sample, gene, RT, rep)
