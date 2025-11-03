train_data_read = read.csv(file= "train_data_imputed_ML_classification_7thFeb2023.csv", header = TRUE, stringsAsFactors = FALSE)
test_data_read = read.csv(file= "test_data_imputed_ML_classification_7thFeb2023.csv", header = TRUE, stringsAsFactors = FALSE)

full_data_read = rbind(train_data_read, test_data_read)
write.csv(full_data_read, file= "total_data_clustering_26thAugust.csv", row.names = FALSE)

library(dplyr)

# read clustering data with assignments
cluster_data = read.csv(file = "total_data_clustering_26thAugust_with_assignments.csv", header = TRUE, stringsAsFactors = FALSE)

cluster_data1 = cluster_data %>% arrange(demopd_ageassess, NHY, MINSNCLD, GDS15SCORE)  %>% select(row_index, demopd_ageassess, NHY, MINSNCLD, GDS15SCORE, affinityprop_cluster_labels, hdbscan_cluster_labels)


lrrkid_data_own_labels = read.csv(file = "lrrk2_data_use_381_79_replace.csv", header = TRUE, stringsAsFactors = FALSE)

lrrk2_own_data = lrrkid_data_own_labels %>% arrange(demopd_ageassess, NHY, MINSNCLD, GDS15SCORE)  %>% select(lrrkid, demopd_ageassess, NHY, MINSNCLD, GDS15SCORE)

# adding lrrk2 subtype id
subtype_map_data = read.csv(file = "lrrk2_nonmotor_part1_analysis_subtypes_10thFeb2024.csv", header = TRUE, stringsAsFactors = FALSE)
subtype_map_data1 = subtype_map_data %>% select(lrrkid, subtype_id)

lrrk2_own_data_plus = merge(lrrk2_own_data, subtype_map_data1, by= "lrrkid", all.x = TRUE)
lrrk2_own_data_plus = lrrk2_own_data_plus %>% arrange(demopd_ageassess, NHY, MINSNCLD, GDS15SCORE)

# adding lrrkid and subtype_id

cluster_data1$lrrkid = lrrk2_own_data_plus$lrrkid
cluster_data1$subtype_id= lrrk2_own_data_plus$subtype_id

write.csv(cluster_data1, file = "cluster_comp_final_August27_2024.csv", row.names = FALSE)

# create subset where subtype_id id not NA

cluster_data2 = subset(cluster_data1, is.na(subtype_id) ==FALSE )
write.csv(cluster_data2, file = "subset_cluster_comp_final_August27_2024.csv", row.names = FALSE)
