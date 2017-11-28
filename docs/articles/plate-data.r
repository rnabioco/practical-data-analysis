library(tidyverse)

# qpcr_info ----------------------------------

col <- stringr::str_pad(1:12, 2, pad = "0")
row <- toupper(letters[1:8])

qpcr_info <-
  tidyr::crossing(col, row) %>%
  mutate(.id = row_number())

# qpcr_expt ----------------------------------

cell <- c('WT', 'YFG-Cas9', 'YFG-shRNA')
gene <- c('ACTIN', 'YFG')
rt <- c('+', '-')
rep <- 1:3

qpcr_expt <- tidyr::crossing(cell, gene, rt, rep)

set.seed(47681)

qpcr_expt <-
  qpcr_expt %>%
  mutate(
    ct = ifelse(gene == 'YFG', sample(24:30, 1),
           ifelse(gene == 'ACTIN', sample(25:27), NA))
  )

cols_rt <- filter(qpcr_info, col %in% col[c(T,F)])
cols_nort <- filter(qpcr_info, col %in% col[c(F,T)])

qpcr_expt_rt <- filter(qpcr_expt, rt == '+')
qpcr_expt_nort <- filter(qpcr_expt, rt == '-')

rt <- bind_cols(cols_rt, qpcr_expt_rt)
nort <- bind_cols(cols_rt, qpcr_expt_nort)
