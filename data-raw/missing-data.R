library(tidyverse)

x <- tibble(
  group = c(1:4, 1, NA),
  id = c(1:3, NA, 2, 4),
  name = c("a", "b", NA, "b", "c", "d"),
  value1 = c(1:5, NA),
  value2 = c(NA, 4:8)
)

missing <- x %>% tidyr::complete(group, nesting(id, name)) %>% as_tibble()

devtools::use_data(missing, overwrite = TRUE)
