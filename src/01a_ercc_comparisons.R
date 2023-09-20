dim(sirv_metadata)
colnames(sirv_metadata)
class(sirv_metadata)
summary(sirv_metadata)
sirv_metadata$who
sirv_metadata$ERCC_R
unique(sirv_metadata$tissue)

#####  kernel density plots by individual
# kernel density plots for ercc data: liver
sirv_ercc_liver <- sirv_metadata %>%
  filter(tissue == "liver")
dim(sirv_ercc_liver)
colnames(sirv_ercc_liver)
#View(sirv_ercc_liver)
sirv_ercc_plot_liver <- ggplot(sirv_ercc_liver,
                              aes(x=ERCC_R, fill=who)) +
                              geom_density(alpha=0.5) +
                              labs(x="ERCC Pearson R", y="Density", 
                                   title="Liver data: Kernel Density Plot of ERCC R values") +
                              theme_minimal()
sirv_ercc_plot_liver
sirv_ercc_plot_liver_jpg <- paste(sirv_graphics,"/sirv_ercc_plot_liver.jpg",sep="")
jpeg(sirv_ercc_plot_liver_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ercc_plot_liver
dev.off()

# kernel density plots for ercc data: fry
sirv_ercc_fry <- sirv_metadata %>%
  filter(tissue == "fry")
dim(sirv_ercc_fry)
colnames(sirv_ercc_fry)
#View(sirv_ercc_fry)
sirv_ercc_plot_fry <- ggplot(sirv_ercc_fry,
                               aes(x=ERCC_R, fill=who)) +
  geom_density(alpha=0.5) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Fry data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_fry
sirv_ercc_plot_fry_jpg <- paste(sirv_graphics,"/sirv_ercc_plot_fry.jpg",sep="")
jpeg(sirv_ercc_plot_fry_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ercc_plot_fry
dev.off()

grid.arrange(sirv_ercc_plot_liver, sirv_ercc_plot_fry, ncol = 1)


##### kernel density plots by batch
# kernel density plots for ercc data: liver
sirv_ercc_liver_batch <- sirv_metadata %>%
  filter(tissue == "liver")
dim(sirv_ercc_liver_batch)
colnames(sirv_ercc_liver_batch)
#View(sirv_ercc_liver)
sirv_ercc_plot_liver_batch <- ggplot(sirv_ercc_liver_batch,
                               aes(x=ERCC_R, fill=batch)) +
  geom_density(alpha=0.5, show.legend=F) +
  facet_wrap(vars(who, batch), nrow=4) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Liver data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_liver_batch
sirv_ercc_plot_liver_batch_jpg <- paste(sirv_graphics,"/sirv_ercc_plot_liver_batch.jpg",sep="")
jpeg(sirv_ercc_plot_liver_batch_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ercc_plot_liver_batch
dev.off()

# kernel density plots for ercc data: fry
sirv_ercc_fry_batch <- sirv_metadata %>%
  filter(tissue == "fry")
dim(sirv_ercc_fry_batch)
colnames(sirv_ercc_fry_batch)
#View(sirv_ercc_fry)
sirv_ercc_plot_fry_batch <- ggplot(sirv_ercc_fry_batch,
                             aes(x=ERCC_R, fill=batch)) +
  geom_density(alpha=0.5, show.legend=F) +
  facet_wrap(vars(who, batch), nrow=4) +
  labs(x="ERCC Pearson R", y="Density", 
       title="Fry data: Kernel Density Plot of ERCC R values") +
  theme_minimal()
sirv_ercc_plot_fry_batch
sirv_ercc_plot_fry_batch_jpg <- paste(sirv_graphics,"/sirv_ercc_plot_fry_batch.jpg",sep="")
jpeg(sirv_ercc_plot_fry_batch_jpg, width = 5, height = 5, units = "in",res=300)
  sirv_ercc_plot_fry_batch
dev.off()

grid.arrange(sirv_ercc_plot_liver_batch, sirv_ercc_plot_fry_batch, ncol = 2)






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

