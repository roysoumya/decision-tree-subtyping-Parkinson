library(dplyr)

read_clus_assgn_data = read.csv(file = "cluster_comp_final_min_cluster_size_ten.csv", header = TRUE, stringsAsFactors = FALSE)

# convert the columns with cluster assignments to character type
read_clus_assgn_data = read_clus_assgn_data %>% mutate_at(vars(affinityprop_cluster_labels, hdbscan_cluster_labels), as.character)

# convert NA values to "Unassigned"
read_clus_assgn_data = read_clus_assgn_data %>% mutate_all(~replace(., is.na(.), "Unassigned"))

write.csv(read_clus_assgn_data, file = "cluster_comp_final_min_cluster_size_ten_unassigned.csv", row.names = FALSE)


#-------- Unassigned Data -----------------
# Data is stored in "final_cluster_comp.csv"

read_clus_assgn_data= read.csv(file = "final_cluster_comp.csv", header = TRUE, stringsAsFactors = FALSE)




# Extract unique values from the columns
own_subtype_col1 <- unique(read_clus_assgn_data$subtype_id)
hdbscan_subtype_col <- unique(read_clus_assgn_data$hdbscan_cluster_labels)
affprop_subtype_col <- unique(read_clus_assgn_data$affinityprop_cluster_labels)

# Initialize matrices with dimensions based on the unique values
co_occurrence_matrix_hdb_own <- matrix(0, nrow = length(own_subtype_col1), ncol = length(hdbscan_subtype_col), dimnames = list(own_subtype_col1, hdbscan_subtype_col))
co_occurrence_matrix_affprop_own <- matrix(0, nrow = length(own_subtype_col1), ncol = length(affprop_subtype_col), dimnames = list(own_subtype_col1, affprop_subtype_col))

# Loop through the data frame and populate the matrices based on co-occurrences
for (i in 1:nrow(read_clus_assgn_data)) {
  co_occurrence_matrix_hdb_own[read_clus_assgn_data$subtype_id[i], read_clus_assgn_data$hdbscan_cluster_labels[i]] <- co_occurrence_matrix_hdb_own[read_clus_assgn_data$subtype_id[i], read_clus_assgn_data$hdbscan_cluster_labels[i]] + 1
}

for (i in 1:nrow(read_clus_assgn_data)) {
  co_occurrence_matrix_affprop_own[read_clus_assgn_data$subtype_id[i], read_clus_assgn_data$affinityprop_cluster_labels[i]] <- co_occurrence_matrix_affprop_own[read_clus_assgn_data$subtype_id[i], read_clus_assgn_data$affinityprop_cluster_labels[i]] + 1
}

# Print the co-occurrence matrices
print("Co-occurrence matrix for HDBSCAN and own subtype:")
print(co_occurrence_matrix_hdb_own)

print("Co-occurrence matrix for Affinity Propagation and own subtype:")
print(co_occurrence_matrix_affprop_own)

# Convert the matrix to a data frame for better readability
co_occurrence_df_HDB <- as.data.frame(co_occurrence_matrix_hdb_own)

co_occurrence_df_AffProp <- as.data.frame(co_occurrence_matrix_affprop_own)


# Exporting the CSV files
write.csv(co_occurrence_df_HDB, file = "HDB_clustering_and_own_overlap.csv")


write.csv(co_occurrence_df_AffProp, file = "AffProp_clustering_and_own_overlap.csv")

# For the analysis, we only select overlaps where the highest intersection is >= 10

# we observe that E4, M3 and L4 has consistent matches for both the clustering algorithms - Affinity Propagation and HDBSCAN

# Convert the matrix to long format for ggplot2
co_occurrence_long <- melt(co_occurrence_matrix)

# Create a heatmap using ggplot2
ggplot(co_occurrence_long, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(x = 'Column 1', y = 'Column 2', fill = 'Count') +
  theme_minimal()


