dim(sirv_data_dd)
colnames(sirv_data_dd)
sirv_data_dd_long <- pivot_longer(sirv_data_dd, cols =6:74, values_to = "ratio")
dim(sirv_data_dd_long)
colnames(sirv_data_dd_long)
sirv_data_dd_long$name <- as.factor(sirv_data_dd_long$name)
#View(sirv_data_dd_long)


# "name" = gene

sirv_scatter_plot_who <- ggplot(sirv_data_dd_long, aes(x=ratio, y=ERCC_R, color=who)) +
         geom_point() +
         facet_wrap(~ name, scales="free") +
         theme_light()
sirv_scatter_plot_who_jpg <- paste(sirv_graphics,"/sirv_scatter_plot_who.jpg",sep="")
jpeg(sirv_scatter_plot_who_jpg, width = 14, height = 8, units = "in",res=300)
  sirv_scatter_plot_who
dev.off()
