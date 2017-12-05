library(tidyverse)

x <- tibble(
  group = c(1:4, 0, NA),
  id = c(1:3, NA, 2, 0),
  name = c("a", "b", NA, "b", "c", "d"),
  value1 = c(1:4, NA, 10),
  value2 = c(NA, 5:8, NA)
)

missing_ex <- x %>% tidyr::complete(group, nesting(id, name)) %>% as_tibble()

devtools::use_data(missing_ex, overwrite = TRUE)
