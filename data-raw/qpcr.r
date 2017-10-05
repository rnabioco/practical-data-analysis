library(tidyverse)
library(stringr)
library(readxl)
library(magrittr)

qpcr <- read_excel('data-raw/qpcr.xlsx')

names(qpcr) %<>% str_to_lower()

qpcr %<>% mutate(cq = as.numeric(cq))
devtools::use_data(qpcr, overwrite = TRUE)
