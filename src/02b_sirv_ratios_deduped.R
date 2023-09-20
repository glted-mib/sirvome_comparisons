dim(sirv_data_dd)
colnames(sirv_data_dd)
sirv_data_dd_long <- pivot_longer(sirv_data_dd, cols =6:74, values_to = "ratio")
dim(sirv_data_dd_long)
colnames(sirv_data_dd_long)
#View(sirv_data_dd_long)

# boxplots for ratio data: liver
sirv_ratios_liver_dd <- sirv_data_dd_long %>%
  filter(tissue == "liver")
dim(sirv_ratios_liver_dd)
colnames(sirv_ratios_liver_dd)

# set floor = 1/16
summary(sirv_ratios_liver_dd$ratio)
sirv_ratios_liver_dd$ratio[sirv_ratios_liver_dd$ratio < 1/16] <- 1/16
summary(sirv_ratios_liver_dd$ratio)

sirv_ratios_plot_liver_dd <- ggplot(sirv_ratios_liver_dd,
                                 aes(x=ratio, fill=batch)) +
  geom_boxplot(alpha=0.5, show.legend=F) +
  facet_wrap(~ batch, nrow=4) +
  scale_x_continuous(trans='log2', 
                     breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x))) +
  labs(x="log2-fold change", 
       title="Liver data: log2-fold change boxplots") +
  theme_minimal() +
  theme(axis.text.y=element_blank(),
        axis.ticks.y=element_blank())
sirv_ratios_plot_liver_dd
sirv_ratios_plot_liver_dd_jpg <- paste(sirv_graphics,"/sirv_ratios_plot_liver_dd.jpg",sep="")
jpeg(sirv_ratios_plot_liver_dd_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ratios_plot_liver_dd
dev.off()

# boxplots for ratio data: fry
sirv_ratios_fry_dd <- sirv_data_dd_long %>%
  filter(tissue == "fry")
dim(sirv_ratios_fry_dd)
colnames(sirv_ratios_fry_dd)

# set floor = 1/16
summary(sirv_ratios_fry_dd$ratio)
sirv_ratios_fry_dd$ratio[sirv_ratios_fry_dd$ratio < 1/16] <- 1/16
summary(sirv_ratios_fry_dd$ratio)

sirv_ratios_plot_fry_dd <- ggplot(sirv_ratios_fry_dd,
                               aes(x=ratio, fill=batch)) +
  geom_boxplot(alpha=0.5, show.legend=F) +
  facet_wrap(~batch, nrow=4) +
  scale_x_continuous(trans='log2', 
                     breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x))) +
  labs(x="log2-fold change",
       title="Fry data: log2-fold change boxplots") +
  theme_minimal() +
  theme(axis.text.y=element_blank(),
        axis.ticks.y=element_blank())
sirv_ratios_plot_fry_dd
sirv_ratios_plot_fry_dd_jpg <- paste(sirv_graphics,"/sirv_ratios_plot_fry_dd.jpg",sep="")
jpeg(sirv_ratios_plot_fry_dd_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ratios_plot_fry_dd
dev.off()


grid.arrange(sirv_ratios_plot_liver_dd, sirv_ratios_plot_fry_dd, ncol = 1)
