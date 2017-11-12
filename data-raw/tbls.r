library(tidyverse)
library(devtools)

mtcars_tbl <- mtcars %>%
  mutate(name = rownames(.)) %>%
  select(name, everything()) %>%
  as_tibble()

devtools::use_data(mtcars_tbl, overwrite = TRUE)
