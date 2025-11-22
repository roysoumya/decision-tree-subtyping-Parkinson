library(dplyr)

lrrk_sub_data2= read.csv(file = "../data/lrrk2_nonmotor_part1_analysis_subtypes.csv", header = TRUE, stringsAsFactors = FALSE)

# summary of non-motor features
# Assuming df is your dataframe
summary_data <- sapply(lrrk_sub_data2, function(x) table(x))

# Print the summary data
print(summary_data)

# Get a list of all named colors in R
named_colors <- colors()

library(ggplot2)

#----- NP1COG -------------------
lrrk_sub_data2$NP1COG = factor(lrrk_sub_data2$NP1COG, levels = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

np1cog_group_data= lrrk_sub_data2 %>% group_by(subtype_id, NP1COG) %>% summarise(pat_count=n())

ggplot(np1cog_group_data, aes(x = subtype_id, y = pat_count))+
  geom_col(aes(fill = NP1COG), width = 0.7) + theme_bw() + theme( text = element_text(size = 10), legend.position="bottom", plot.title = element_text(hjust = 0.5)) + labs(x="Subtype id", y= "Patient count", fill="MDS-UPDRS", title="Cognitive Impairment")  +  scale_fill_manual(values = c("Normal" = "green3", "Slight" = "darkseagreen", "Mild"= "skyblue", "Moderate" = "orange", "Severe" = "sienna"), breaks = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

#----- NP1SLPN -------------------
lrrk_sub_data2$NP1SLPN = factor(lrrk_sub_data2$NP1SLPN, levels = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

np1slpn_group_data= lrrk_sub_data2 %>% group_by(subtype_id, NP1SLPN) %>% summarise(pat_count=n())

ggplot(np1slpn_group_data, aes(x = subtype_id, y = pat_count))+
  geom_col(aes(fill = NP1SLPN), width = 0.7) + theme_bw() + theme( text = element_text(size = 10), legend.position="bottom", plot.title = element_text(hjust = 0.5)) + labs(x="Subtype id", y= "Patient count", fill="MDS-UPDRS", title="Sleep Problems (night)")  +  scale_fill_manual(values = c("Normal" = "green3", "Slight" = "darkseagreen", "Mild"= "skyblue", "Moderate" = "orange", "Severe" = "sienna"), breaks = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

#----- NP1SLPD -------------------
lrrk_sub_data2$NP1SLPD = factor(lrrk_sub_data2$NP1SLPD, levels = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

np1slpd_group_data= lrrk_sub_data2 %>% group_by(subtype_id, NP1SLPD) %>% summarise(pat_count=n())

ggplot(np1slpd_group_data, aes(x = subtype_id, y = pat_count))+
  geom_col(aes(fill = NP1SLPD), width = 0.7) + theme_bw() + theme( text = element_text(size = 10), legend.position="bottom", plot.title = element_text(hjust = 0.5)) + labs(x="Subtype id", y= "Patient count", fill="MDS-UPDRS", title="Daytime Sleepiness")  +  scale_fill_manual(values = c("Normal" = "green3", "Slight" = "darkseagreen", "Mild"= "skyblue", "Moderate" = "orange", "Severe" = "sienna"), breaks = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

#----- NP1CNST -------------------
lrrk_sub_data2$NP1CNST = factor(lrrk_sub_data2$NP1CNST, levels = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

np1cnst_group_data= lrrk_sub_data2 %>% group_by(subtype_id, NP1CNST) %>% summarise(pat_count=n())

ggplot(np1cnst_group_data, aes(x = subtype_id, y = pat_count))+
  geom_col(aes(fill = NP1CNST), width = 0.7) + theme_bw() + theme( text = element_text(size = 10), legend.position="bottom", plot.title = element_text(hjust = 0.5)) + labs(x="Subtype id", y= "Patient count", fill="MDS-UPDRS", title="Constipation Problems")  +  scale_fill_manual(values = c("Normal" = "green3", "Slight" = "darkseagreen", "Mild"= "skyblue", "Moderate" = "orange", "Severe" = "sienna"), breaks = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

#----- NP1URN -------------------
lrrk_sub_data2$NP1URN = factor(lrrk_sub_data2$NP1URN, levels = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

np1urn_group_data= lrrk_sub_data2 %>% group_by(subtype_id, NP1URN) %>% summarise(pat_count=n())

#ggplot(nhy_group_data, aes(x = subtype_id, y= count, fill = "NHY")) + 
ggplot(np1urn_group_data, aes(x = subtype_id, y = pat_count))+
  geom_col(aes(fill = NP1URN), width = 0.7) + theme_bw()+ theme( text = element_text(size = 10), legend.position="bottom", plot.title = element_text(hjust = 0.5)) + labs(x="Subtype id", y= "Patient count", fill="MDS-UPDRS", title="Urinary Problems")  +  scale_fill_manual(values = c("Normal" = "green3", "Slight" = "darkseagreen", "Mild"= "skyblue", "Moderate" = "orange", "Severe" = "sienna"), breaks = c("Normal", "Slight", "Mild", "Moderate", "Severe"))


#----- NP1PAIN -------------------
lrrk_sub_data2$NP1PAIN = factor(lrrk_sub_data2$NP1PAIN, levels = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

np1pain_group_data= lrrk_sub_data2 %>% group_by(subtype_id, NP1PAIN) %>% summarise(pat_count=n())

ggplot(np1pain_group_data, aes(x = subtype_id, y = pat_count))+
  geom_col(aes(fill = NP1PAIN), width = 0.7) + theme_bw() + theme( text = element_text(size = 10), legend.position="bottom", plot.title = element_text(hjust = 0.5)) + labs(x="Subtype id", y= "Patient count", fill="MDS-UPDRS", title="Pain and Other Sensations")  +  scale_fill_manual(values = c("Normal" = "green3", "Slight" = "darkseagreen", "Mild"= "skyblue", "Moderate" = "orange", "Severe" = "sienna"), breaks = c("Normal", "Slight", "Mild", "Moderate", "Severe"))


#----- NP1FATG -------------------
lrrk_sub_data2$NP1FATG = factor(lrrk_sub_data2$NP1FATG, levels = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

np1fatg_group_data= lrrk_sub_data2 %>% group_by(subtype_id, NP1FATG) %>% summarise(pat_count=n())

ggplot(np1fatg_group_data, aes(x = subtype_id, y = pat_count))+
  geom_col(aes(fill = NP1FATG), width = 0.7) + theme_bw() + theme( text = element_text(size = 10), legend.position="bottom", plot.title = element_text(hjust = 0.5)) + labs(x="Subtype id", y= "Patient count", fill="MDS-UPDRS", title="Fatigue")  + scale_fill_manual(values = c("Normal" = "green3", "Slight" = "darkseagreen", "Mild"= "skyblue", "Moderate" = "orange", "Severe" = "sienna"), breaks = c("Normal", "Slight", "Mild", "Moderate", "Severe"))


#----- NP1HALL -------------------
lrrk_sub_data2$NP1HALL = factor(lrrk_sub_data2$NP1HALL, levels = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

np1hall_group_data= lrrk_sub_data2 %>% group_by(subtype_id, NP1HALL) %>% summarise(pat_count=n())

ggplot(np1hall_group_data, aes(x = subtype_id, y = pat_count))+
  geom_col(aes(fill = NP1HALL), width = 0.7) + theme_bw() + theme( text = element_text(size = 10), legend.position="bottom", plot.title = element_text(hjust = 0.5)) + labs(x="Subtype id", y= "Patient count", fill="MDS-UPDRS", title="Hallucinations and Psychosis")  + scale_fill_manual(values = c("Normal" = "green3", "Slight" = "darkseagreen", "Mild"= "skyblue", "Moderate" = "orange", "Severe" = "sienna"), breaks = c("Normal", "Slight", "Mild", "Moderate", "Severe"))

