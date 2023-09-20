dim(sirv_data)
colnames(sirv_data)
sirv_data_long <- pivot_longer(sirv_data, cols =6:74, values_to = "ratio")
dim(sirv_data_long)
colnames(sirv_data_long)

# boxplots for ratio data: liver
sirv_ratios_liver <- sirv_data_long %>%
  filter(tissue == "liver")
dim(sirv_ratios_liver)
colnames(sirv_ratios_liver)

# set floor = 1/16
summary(sirv_ratios_liver$ratio)
sirv_ratios_liver$ratio[sirv_ratios_liver$ratio < 1/16] <- 1/16
summary(sirv_ratios_liver$ratio)

sirv_ratios_plot_liver <- ggplot(sirv_ratios_liver,
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
sirv_ratios_plot_liver
sirv_ratios_plot_liver_jpg <- paste(sirv_graphics,"/sirv_ratios_plot_liver.jpg",sep="")
jpeg(sirv_ratios_plot_liver_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ratios_plot_liver
dev.off()

# boxplots for ratio data: fry
sirv_ratios_fry <- sirv_data_long %>%
  filter(tissue == "fry")
dim(sirv_ratios_fry)
colnames(sirv_ratios_fry)

# set floor = 1/16
summary(sirv_ratios_fry$ratio)
sirv_ratios_fry$ratio[sirv_ratios_fry$ratio < 1/16] <- 1/16
summary(sirv_ratios_fry$ratio)

sirv_ratios_plot_fry <- ggplot(sirv_ratios_fry,
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
sirv_ratios_plot_fry
sirv_ratios_plot_fry_jpg <- paste(sirv_graphics,"/sirv_ratios_plot_fry.jpg",sep="")
jpeg(sirv_ratios_plot_fry_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ratios_plot_fry
dev.off()


grid.arrange(sirv_ratios_plot_liver, sirv_ratios_plot_fry, ncol = 1)
