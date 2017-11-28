library(tidyverse)

sample <- c('wt', 'mut')
gene <- c('IFN', 'ACTIN')
time <- c(0, 12, 24, 48)
rt <- c('+', '-') # reverse transcriptase added?
rep <- 1:3

set.seed(47681)
sample_data <- crossing(sample, time, gene, rep, rt) %>%
  rowwise() %>%
  mutate(ct = ifelse(sample == "wt", sample(15:20, 1), sample(22:26, 1)))

plus_rts <- filter(sample_data, rt == "+")
minus_rts <- filter(sample_data, rt == "-") %>% mutate(ct = 30)

sample_data <- bind_rows(plus_rts, minus_rts) %>% arrange(sample, time, gene, rep)

qpcr_names <- sample_data %>%
  unite(name, sample, time, gene, rt, rep, sep = "_") %>%
  pluck("name") %>%
  matrix(nrow = 8, ncol = 12) %>%
  as_tibble() %>%
  set_names(nm = 1:12) %>%
  mutate(row = toupper(letters[1:8])) %>%
  select(row, everything())

qpcr_data <- sample_data %>%
  pluck("ct") %>%
  matrix(nrow = 8, ncol = 12) %>%
  as_tibble() %>%
  set_names(nm = 1:12) %>%
  mutate(row = toupper(letters[1:8])) %>%
  select(row, everything())

devtools::use_data(qpcr_names, compress = 'xz')
devtools::use_data(qpcr_data, compress = 'xz')
