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
  facet_wrap(vars(who, batch), nrow=4) +
  scale_x_continuous(trans='log2', 
                     breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x))) +
  labs(x="log2-fold change", 
       title="Liver data: log2-fold change boxplots") +
  theme_minimal()
sirv_ratios_plot_liver


# boxplots for ratio data: fry
sirv_ratios_fry <- sirv_data_long %>%
  filter(tissue == "fry")
dim(sirv_ratios_fry)
colnames(sirv_ratios_fry)

sirv_ratios_plot_fry <- ggplot(sirv_ratios_fry,
                                 aes(x=ratio, fill=batch)) +
  geom_boxplot(alpha=0.5, show.legend=F) +
  facet_wrap(~batch, nrow=4) +
  scale_x_continuous(trans='log2', 
                     breaks = trans_breaks("log2", function(x) 2^x),
                     labels = trans_format("log2", math_format(2^.x))) +
  labs(x="log2-fold change",
       title="Fry data: log2-fold change boxplots") +
  theme_minimal()
sirv_ratios_plot_fry

grid.arrange(sirv_ratios_plot_liver, sirv_ratios_plot_fry, ncol = 2)
