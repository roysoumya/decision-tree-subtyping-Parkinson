library(dplyr)

lrrk_sub_data2 = read.csv(file = "../data/violin_plot_data_each_subtype_Feb11_2024.csv", header = TRUE, stringsAsFactors = FALSE)

library(vioplot)

vioplot(GDS15SCORE~subtype_id, data= lrrk_sub_data2, xlab= "Subtype id", ylab= "Geriatric Depression Scale")

vioplot(ageonset~subtype_id, data= lrrk_sub_data2, xlab= "Subtype id", ylab= "Age of PD onset")

vioplot(pd_duration~subtype_id, data= lrrk_sub_data2, xlab= "Subtype id", ylab= "PD duration (in years)")

lrrk_sub_data2$NHY = as.factor(lrrk_sub_data2$NHY)

library(ggplot2)

nhy_group_data= lrrk_sub_data2 %>% group_by(c(subtype_id, NHY)) %>% summarise(pat_count=n())
#ggplot(nhy_group_data, aes(x = subtype_id, y= count, fill = "NHY")) + 
ggplot(nhy_group_data, aes(x = subtype_id, y = pat_count))+
  geom_col(aes(fill = NHY), width = 0.7) + theme_bw() + theme( text = element_text(size = 11), legend.position="bottom") + labs(x="Subtype id", y= "Patient count", fill="Hoehn and \n Yahr Stage") 
