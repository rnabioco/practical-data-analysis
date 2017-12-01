library(tidyverse)

cell <- c('MAGIC-WT', 'MAGIC-hypo', 'MAGIC-siRNA', 'MAGIC-null')
gene <- c('MAGIC', 'WAND', 'POOF', 'ACTIN')
time <- c(0, 12, 24, 48)
rt <- c('+', '-') # reverse transcriptase added?
rep <- 1:3

set.seed(47681)
sample_data <- crossing(cell, time, gene, rep, rt)

plus_rts <- filter(sample_data, rt == "+")

t0 <- filter(plus_rts, time == 0) %>% rowwise() %>% mutate(exp = sample(5:15, 1))
t12 <- filter(plus_rts, time == 12) %>% rowwise() %>% mutate(exp = sample(45:55, 1))
t24 <- filter(plus_rts, time == 24) %>% rowwise() %>% mutate(exp = sample(95:100, 1))
t48 <- filter(plus_rts, time == 48) %>% rowwise() %>% mutate(exp = sample(350:600, 1))

plus_rts <- bind_rows(t0, t12, t24, t48)

# add multiplier for genes
magics <- filter(plus_rts, gene == "MAGIC") %>% mutate(exp = exp * 1.5)
wands <- filter(plus_rts, gene == "WAND") %>%
  mutate(exp = ifelse(cell == "MAGIC-hypo", exp / 10, exp ^ 1.2))
poofs <- filter(plus_rts, gene == "POOF") %>%
  mutate(exp = ifelse(cell == "MAGIC-null", exp / 10, exp ^ 3))
actins <- filter(plus_rts, gene == "ACTIN") %>% mutate(exp = exp * 0.2)

plus_rts <- bind_rows(magics, wands, poofs, actins)

# adjust mutants
wts <- filter(plus_rts, cell = 'MAGIC-WT')
hypos <- filter(plus_rts, cell = 'MAGIC-hypo') %>% rowwise() %>% mutate(exp = exp / 4)
sirna <- filter(plus_rts, cell = 'MAGIC-siRNA') %>% rowwise() %>% mutate(exp = exp / 2)
nulls <- filter(plus_rts, cell = 'MAGIC-null') %>% rowwise() %>% mutate(exp = exp / 10)
plus_rts <- bind_rows(wts, hypos, sirna, nulls)

# make values 1 so they appear on a log scale
minus_rts <- filter(sample_data, rt == "-") %>% mutate(exp = 1)

sample_data <- bind_rows(plus_rts, minus_rts) %>% arrange(cell, time, gene, rep)

qpcr384_names <- sample_data %>%
  unite(name, cell, time, gene, rt, rep, sep = "_") %>%
  pluck("name") %>%
  matrix(nrow = 16, ncol = 24) %>%
  as_tibble() %>%
  set_names(nm = 1:24) %>%
  mutate(row = toupper(letters[1:16])) %>%
  select(row, everything())

qpcr384_data <- sample_data %>%
  pluck("exp") %>%
  matrix(nrow = 16, ncol = 24) %>%
  as_tibble() %>%
  set_names(nm = 1:24) %>%
  mutate(row = toupper(letters[1:16])) %>%
  select(row, everything())

readr::write_excel_csv(qpcr384_data, 'inst/extdata/qpcr-data-384.csv')
readr::write_excel_csv(qpcr384_names, 'inst/extdata/qpcr-names-384.csv')
