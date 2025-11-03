# taken from clinical-characterisation-LRRK2.R
library(dplyr)

lrrk2_id_subtype_map= lrrk2_sub_data1 %>% select(lrrkid, subtype_id)

# read genetic data patients
gene_data_available= read.csv(file = "gene_lrrkid_available_Feb2022.csv", header = TRUE, stringsAsFactors = FALSE)

# overlap between patients of proposed six subtypes and patients with available genetic data
overlap_lrrkids_gene_data= intersect(lrrk2_id_subtype_map$lrrkid, gene_data_available$lrrkid)
# we observe zero overlap of patients

#--- Next, checking overlap with longitudinal data
long_data= read.csv(file = "LRRK2C20170626_AJ_Long_NY_sites.csv", header = TRUE, stringsAsFactors = FALSE)
long_data_grp= long_data %>% group_by(lrrkid) %>% summarise(count=n())
long_data_grp_morethan1= subset(long_data_grp, count > 1)

overlap_lrrkids_long_data= intersect(lrrk2_id_subtype_map$lrrkid, long_data_grp_morethan1$lrrkid)

lrrk2_subtype_data$datasrc = as.factor(lrrk2_subtype_data$datasrc)
library(ggplot2)
# Basic histogram
ggplot(lrrk2_subtype_data, aes(x=datasrc)) + geom_histogram(stat = "count")
