
con <- url("https://scrnaseq-public-datasets.s3.amazonaws.com/scater-objects/deng-reads.rds")
sce <- readRDS(con)

# downsample to 12 cells per class

set.seed(42)
cell_ids <- colData(sce) %>% 
  as.data.frame() %>% 
  as_tibble(rownames ="cell") %>% 
  group_by(cell_type1) %>% 
  sample_n(12) %>% 
  pull(cell)

esc_mat <- assay(sce, "counts")
esc_mat <- esc_mat[, cell_ids]

# make new ids 
new_ids <- data_frame(old_id = colnames(esc_mat)) %>% 
  mutate(cell_type = str_remove(old_id, "\\.[0-9]+")) %>%
  group_by(cell_type) %>% 
  mutate(new_id = str_c(cell_type, "_", row_number())) %>%
  ungroup() 

colnames(esc_mat) <- new_ids$new_id

# reorder based on time
time_ordering <- c(
  "zy",
  "early2cell",
  "mid2cell",
  "late2cell",
  "4cell",
  "8cell",
  "16cell",
  "earlyblast",
  "midblast",
  "lateblast"
)

new_ids <- mutate(new_ids, cell_type = factor(cell_type, 
                                              levels = time_ordering)) %>% 
  arrange(cell_type)

esc_mat <- esc_mat[, new_ids$new_id]

usethis::use_data(esc_mat, overwrite = TRUE, compress = "xz")
