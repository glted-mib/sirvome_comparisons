dim(sirv_metadata_dd)
colnames(sirv_metadata_dd)
class(sirv_metadata_dd)
summary(sirv_metadata_dd)
sirv_metadata_dd$who
sirv_metadata_dd$ERCC_R
unique(sirv_metadata_dd$tissue)

#####  kernel density plots by individual
# kernel density plots for ercc data: liver
sirv_ercc_liver_dd <- sirv_metadata_dd %>%
  filter(tissue == "liver")
dim(sirv_ercc_liver_dd)
colnames(sirv_ercc_liver_dd)
#View(sirv_ercc_liver_dd)
sirv_ercc_plot_liver_dd <- ggplot(sirv_ercc_liver_dd,
                               aes(x=ERCC_R, fill=who)) +
  geom_density(alpha=0.5) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Liver data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_liver_dd
sirv_ercc_plot_liver_dd_jpg <- paste(sirv_graphics,"/sirv_ercc_plot_liver_dd.jpg",sep="")
jpeg(sirv_ercc_plot_liver_dd_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ercc_plot_liver_dd
dev.off()

# kernel density plots for ercc data: fry
sirv_ercc_fry_dd <- sirv_metadata_dd %>%
  filter(tissue == "fry")
dim(sirv_ercc_fry_dd)
colnames(sirv_ercc_fry_dd)
#View(sirv_ercc_fry_dd)
sirv_ercc_plot_fry_dd <- ggplot(sirv_ercc_fry_dd,
                             aes(x=ERCC_R, fill=who)) +
  geom_density(alpha=0.5) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Fry data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_fry_dd
sirv_ercc_plot_fry_dd_jpg <- paste(sirv_graphics,"/sirv_ercc_plot_fry_dd.jpg",sep="")
jpeg(sirv_ercc_plot_fry_dd_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ercc_plot_fry_dd
dev.off()

grid.arrange(sirv_ercc_plot_liver_dd, sirv_ercc_plot_fry_dd, ncol = 1)


##### kernel density plots by batch
# kernel density plots for ercc data: liver
sirv_ercc_liver_dd_batch <- sirv_metadata_dd %>%
  filter(tissue == "liver")
dim(sirv_ercc_liver_dd_batch)
colnames(sirv_ercc_liver_dd_batch)
#View(sirv_ercc_liver)
sirv_ercc_plot_liver_dd_batch <- ggplot(sirv_ercc_liver_dd_batch,
                                     aes(x=ERCC_R, fill=batch)) +
  geom_density(alpha=0.5, show.legend=F) +
  facet_wrap(vars(who, batch), nrow=4) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Liver data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_liver_dd_batch
sirv_ercc_plot_liver_dd_batch_jpg <- paste(sirv_graphics,"/sirv_ercc_plot_liver_dd_batch.jpg",sep="")
jpeg(sirv_ercc_plot_liver_dd_batch_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ercc_plot_liver_dd_batch
dev.off()

# kernel density plots for ercc data: fry
sirv_ercc_fry_dd_batch <- sirv_metadata_dd %>%
  filter(tissue == "fry")
dim(sirv_ercc_fry_dd_batch)
colnames(sirv_ercc_fry_dd_batch)
#View(sirv_ercc_fry)
sirv_ercc_plot_fry_dd_batch <- ggplot(sirv_ercc_fry_dd_batch,
                                   aes(x=ERCC_R, fill=batch)) +
  geom_density(alpha=0.5, show.legend=F) +
  facet_wrap(vars(who, batch), nrow=4) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Fry data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_fry_dd_batch
sirv_ercc_plot_fry_dd_batch_jpg <- paste(sirv_graphics,"/sirv_ercc_plot_fry_dd_batch.jpg",sep="")
jpeg(sirv_ercc_plot_fry_dd_batch_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ercc_plot_fry_dd_batch
dev.off()

grid.arrange(sirv_ercc_plot_liver_dd_batch, sirv_ercc_plot_fry_dd_batch, ncol = 2)






#####  boxplots by individual
# boxplots for ercc data: liver
sirv_ercc_liver <- sirv_metadata %>%
  filter(tissue == "liver")
dim(sirv_ercc_liver)
colnames(sirv_ercc_liver)
#View(sirv_ercc_liver)
sirv_ercc_plot_liver <- ggplot(sirv_ercc_liver,
                               aes(x=ERCC_R, fill=who)) +
  geom_boxplot(alpha=0.5) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Liver data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_liver

# kernel density plots for ercc data: fry
sirv_ercc_fry <- sirv_metadata %>%
  filter(tissue == "fry")
dim(sirv_ercc_fry)
colnames(sirv_ercc_fry)
#View(sirv_ercc_fry)
sirv_ercc_plot_fry <- ggplot(sirv_ercc_fry,
                             aes(x=ERCC_R, fill=who)) +
  geom_boxplot(alpha=0.5) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Fry data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_fry

grid.arrange(sirv_ercc_plot_liver, sirv_ercc_plot_fry, ncol = 1)


##### kernel density plots by batch
# kernel density plots for ercc data: liver
sirv_ercc_liver <- sirv_metadata %>%
  filter(tissue == "liver")
dim(sirv_ercc_liver)
colnames(sirv_ercc_liver)
#View(sirv_ercc_liver)
sirv_ercc_plot_liver <- ggplot(sirv_ercc_liver,
                               aes(x=ERCC_R, fill=batch)) +
  geom_boxplot(alpha=0.5, show.legend=F) +
  facet_wrap(vars(who, batch), nrow=4) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Liver data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_liver

# kernel density plots for ercc data: fry
sirv_ercc_fry <- sirv_metadata %>%
  filter(tissue == "fry")
dim(sirv_ercc_fry)
colnames(sirv_ercc_fry)
#View(sirv_ercc_fry)
sirv_ercc_plot_fry <- ggplot(sirv_ercc_fry,
                             aes(x=ERCC_R, fill=batch)) +
  geom_boxplot(alpha=0.5, show.legend=F) +
  facet_wrap(vars(who, batch), nrow=4) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Fry data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_fry

grid.arrange(sirv_ercc_plot_liver, sirv_ercc_plot_fry, ncol = 2)

