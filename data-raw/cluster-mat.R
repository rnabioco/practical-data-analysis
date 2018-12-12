h1 <- c(10,20,10,20,10,20,10,20)
h2 <- c(20,10,20,10,20,10,20,10)

l1 <- c(1,3,1,3,1,3,1,3)
l2 <- c(3,1,3,1,3,1,3,1)

clust_mat <- rbind(h1, h2, l1, l2)

colnames(clust_mat) <- str_c("timepoint_", c(1:8))

usethis::use_data(clust_mat, overwrite = TRUE, compress = "xz")
