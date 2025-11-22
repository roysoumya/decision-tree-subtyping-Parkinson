library(dplyr)

lrrk2_subtype_data= read.csv(file = "lrrk2_pos_data_miss30_subtype_id_mapped.csv", header = TRUE, stringsAsFactors = FALSE)

lrrk2_subtype_data= lrrk2_subtype_data

subtype_stats= "
table(lrrk2_subtype_data$subtype_id)

early4  late1  late2  late4 mixed3 mixed7   None 
 27       21     25   27     26     25      1319
 "

lrrk2_sub_data1= subset(lrrk2_subtype_data, subtype_id != 'None') # leads to 151 observations

# Exploratory analysis with features of type "Diagnostic Checklist"
diag_chk_features= c('DCBRADY','DCRIGID','DCRTREM','RTRMHZ','ASYMMONS','DCUNONST','DCASYMM','DCPRGDIS','SUSTRMS','STRKSTPD','HXHINJ','HXENCEPH','OGC','HYCEPCT','MPTPEXP','DCLDOPCH','CERESIGN','BABINSKI','SGPSVSAC','GT1AFREL','OTCSPDSX','NELEONSX','DYSUNMED','AUNOERLY','DEMPREMT','MEMLNGPR','DCPOSINS','PINS3YSX','HXFRZERL','HXHALERL','HXUNIL3Y','DCPD10Y','LDOPRTYP','LDOPRSPC','DCLPDO5Y','PROBIPD')

common_features= intersect(colnames(lrrk2_sub_data1), diag_chk_features)
# only 26 common out of 36 diagnostic check features, meaning only 26 features have less than 30% missing data

imp_features = c('datasrc', 'lrrkid', 'subtype_id', 'MODHY', 'lrrk2fam', 'lrrk2sub', 'gender', 'ageonset', 'demopd_ageassess', 'NHY', 'pd_duration', 'GDS15SCORE')

total_features= union(common_features, imp_features)

lrrk_sub_data2= lrrk2_sub_data1 %>% select(total_features) %>% arrange(subtype_id, lrrkid)

write.csv(lrrk_sub_data2, file = "lrrk2_diag_chk_analysis_subtypes.csv", row.names = FALSE)

# summary of age of assessment, age of PD onset
lrrk_sub_summ_data= lrrk_sub_data2 %>% group_by(subtype_id)  %>% summarise(present_age_mean= mean(demopd_ageassess, na.rm = TRUE), present_age_sd= sd(demopd_ageassess, na.rm=TRUE), ageonset_mean= mean(ageonset, na.rm = TRUE), ageonset_sd= sd(ageonset, na.rm=TRUE), count= n())

# summary of gender
lrrk_sub_summ_data_gender= lrrk_sub_data2 %>% group_by(subtype_id, gender) %>% summarise(count=n())

lrrk2_sub_data3= lrrk_sub_data2 %>% select(-lrrk2fam, -MODHY, -HXFRZERL, -DEMPREMT, -PROBIPD, -LDOPRTYP, -GT1AFREL, -ASYMMONS)


# summary of diagnostic checklist features
lrrk2_sub_data3$MPTPEXP = as.numeric(lrrk2_sub_data3$MPTPEXP)
lrrk2_sub_data3$BABINSKI = as.numeric(lrrk2_sub_data3$BABINSKI)       
lrrk2_sub_data3$NELEONSX = as.numeric(lrrk2_sub_data3$NELEONSX)       
lrrk2_sub_data3$AUNOERLY = as.numeric(lrrk2_sub_data3$AUNOERLY)

lrrk_diag_summ_data= lrrk2_sub_data3 %>% group_by(subtype_id) %>% summarise(pat_count= n(), DCBRADY_sum= sum(DCBRADY, na.rm = TRUE), DCRIGID_sum= sum(DCRIGID, na.rm = TRUE),DCRTREM_sum= sum(DCRTREM, na.rm = TRUE),MPTPEXP_sum= sum(MPTPEXP, na.rm = TRUE),BABINSKI_sum= sum(BABINSKI, na.rm = TRUE),NELEONSX_sum= sum(NELEONSX, na.rm = TRUE),AUNOERLY_sum= sum(AUNOERLY, na.rm = TRUE),RTRMHZ_sum= sum(RTRMHZ, na.rm = TRUE),DCPRGDIS_sum= sum(DCPRGDIS, na.rm = TRUE),DCASYMM_sum= sum(DCASYMM, na.rm = TRUE),DCLDOPCH_sum= sum(DCLDOPCH, na.rm = TRUE),DCPD10Y_sum= sum(DCPD10Y, na.rm = TRUE),HXENCEPH_sum= sum(HXENCEPH, na.rm = TRUE),DCPOSINS_sum= sum(DCPOSINS, na.rm = TRUE),STRKSTPD_sum= sum(STRKSTPD, na.rm = TRUE),SUSTRMS_sum= sum(SUSTRMS, na.rm = TRUE),OGC_sum= sum(OGC, na.rm = TRUE),SGPSVSAC_sum= sum(SGPSVSAC, na.rm = TRUE),CERESIGN_sum= sum(CERESIGN, na.rm = TRUE),HXUNIL3Y_sum= sum(HXUNIL3Y, na.rm = TRUE),lrrk2sub_sum= sum(lrrk2sub, na.rm = TRUE))

write.csv(lrrk_diag_summ_data, file = "lrrk_diag_summary_stats.csv", row.names = FALSE)








training_data= read.csv(file = "lrrk2_data_analysis.csv", header = TRUE, stringsAsFactors = FALSE)

total_data_boundary= subset(training_data, ageonset >45 & ageonset < 55) # 94 observations


#----- LRRK2 all data analysis ---------------------
lrrk_all_stats= lrrk2_subtype_data %>% select(total_features)
# summary of age of assessment, age of PD onset
lrrk_sub_summ_data= lrrk_all_stats %>% summarise(present_age_mean= mean(demopd_ageassess, na.rm = TRUE), present_age_sd= sd(demopd_ageassess, na.rm=TRUE), ageonset_mean= mean(ageonset, na.rm = TRUE), ageonset_sd= sd(ageonset, na.rm=TRUE), count= n())

# summary of gender
lrrk_sub_summ_data_gender= lrrk_all_stats %>% group_by(gender) %>% summarise(count=n())

# summary of diagnostic checklist features
lrrk_all_stats$MPTPEXP = as.numeric(lrrk_all_stats$MPTPEXP)
lrrk_all_stats$BABINSKI = as.numeric(lrrk_all_stats$BABINSKI)       
lrrk_all_stats$NELEONSX = as.numeric(lrrk_all_stats$NELEONSX)       
lrrk_all_stats$AUNOERLY = as.numeric(lrrk_all_stats$AUNOERLY)

lrrk_all_stats_diag_summ_data= lrrk_all_stats %>% summarise(pat_count= n(), DCBRADY_sum= sum(DCBRADY, na.rm = TRUE), DCRIGID_sum= sum(DCRIGID, na.rm = TRUE),DCRTREM_sum= sum(DCRTREM, na.rm = TRUE),MPTPEXP_sum= sum(MPTPEXP, na.rm = TRUE),BABINSKI_sum= sum(BABINSKI, na.rm = TRUE),NELEONSX_sum= sum(NELEONSX, na.rm = TRUE),AUNOERLY_sum= sum(AUNOERLY, na.rm = TRUE),RTRMHZ_sum= sum(RTRMHZ, na.rm = TRUE),DCPRGDIS_sum= sum(DCPRGDIS, na.rm = TRUE),DCASYMM_sum= sum(DCASYMM, na.rm = TRUE),DCLDOPCH_sum= sum(DCLDOPCH, na.rm = TRUE),DCPD10Y_sum= sum(DCPD10Y, na.rm = TRUE),HXENCEPH_sum= sum(HXENCEPH, na.rm = TRUE),DCPOSINS_sum= sum(DCPOSINS, na.rm = TRUE),STRKSTPD_sum= sum(STRKSTPD, na.rm = TRUE),SUSTRMS_sum= sum(SUSTRMS, na.rm = TRUE),OGC_sum= sum(OGC, na.rm = TRUE),SGPSVSAC_sum= sum(SGPSVSAC, na.rm = TRUE),CERESIGN_sum= sum(CERESIGN, na.rm = TRUE),HXUNIL3Y_sum= sum(HXUNIL3Y, na.rm = TRUE),lrrk2sub_sum= sum(lrrk2sub, na.rm = TRUE))

lrrk_all_stats_diag_summ_data_T = as.data.frame( t(lrrk_all_stats_diag_summ_data))
lrrk_all_stats_diag_summ_data_T = lrrk_all_stats_diag_summ_data_T %>% mutate(normalized= V1/1470)


#------ LRRK2 all features analysis 397 patients MDS-UPDRS features ------------

lrrk2_mdsupdrs_all_features= read.csv(file = "lrrk2_all_features_mdsupdrs_subset.csv", header = TRUE, stringsAsFactors = FALSE)

lrrk_all_stats= lrrk2_mdsupdrs_all_features
# summary of age of assessment, age of PD onset
lrrk_sub_summ_data= lrrk_all_stats %>% summarise(present_age_mean= mean(demopd_ageassess, na.rm = TRUE), present_age_sd= sd(demopd_ageassess, na.rm=TRUE), ageonset_mean= mean(ageonset, na.rm = TRUE), ageonset_sd= sd(ageonset, na.rm=TRUE), count= n())

# summary of gender
lrrk_sub_summ_data_gender= lrrk_all_stats %>% group_by(gender) %>% summarise(count=n())

# summary of diagnostic checklist features
lrrk_all_stats$MPTPEXP = as.numeric(lrrk_all_stats$MPTPEXP)
lrrk_all_stats$BABINSKI = as.numeric(lrrk_all_stats$BABINSKI)       
lrrk_all_stats$NELEONSX = as.numeric(lrrk_all_stats$NELEONSX)       
lrrk_all_stats$AUNOERLY = as.numeric(lrrk_all_stats$AUNOERLY)

lrrk_all_stats_diag_summ_data= lrrk_all_stats %>% summarise(pat_count= n(), DCBRADY_sum= sum(DCBRADY, na.rm = TRUE), DCRIGID_sum= sum(DCRIGID, na.rm = TRUE),DCRTREM_sum= sum(DCRTREM, na.rm = TRUE),MPTPEXP_sum= sum(MPTPEXP, na.rm = TRUE),BABINSKI_sum= sum(BABINSKI, na.rm = TRUE),NELEONSX_sum= sum(NELEONSX, na.rm = TRUE),AUNOERLY_sum= sum(AUNOERLY, na.rm = TRUE),RTRMHZ_sum= sum(RTRMHZ, na.rm = TRUE),DCPRGDIS_sum= sum(DCPRGDIS, na.rm = TRUE),DCASYMM_sum= sum(DCASYMM, na.rm = TRUE),DCLDOPCH_sum= sum(DCLDOPCH, na.rm = TRUE),DCPD10Y_sum= sum(DCPD10Y, na.rm = TRUE),HXENCEPH_sum= sum(HXENCEPH, na.rm = TRUE),DCPOSINS_sum= sum(DCPOSINS, na.rm = TRUE),STRKSTPD_sum= sum(STRKSTPD, na.rm = TRUE),SUSTRMS_sum= sum(SUSTRMS, na.rm = TRUE),OGC_sum= sum(OGC, na.rm = TRUE),SGPSVSAC_sum= sum(SGPSVSAC, na.rm = TRUE),CERESIGN_sum= sum(CERESIGN, na.rm = TRUE),HXUNIL3Y_sum= sum(HXUNIL3Y, na.rm = TRUE),lrrk2sub_sum= sum(lrrk2sub, na.rm = TRUE))

lrrk_all_stats_diag_summ_data_T = as.data.frame( t(lrrk_all_stats_diag_summ_data))
lrrk_all_stats_diag_summ_data_T = lrrk_all_stats_diag_summ_data_T %>% mutate(normalized= V1/397)

