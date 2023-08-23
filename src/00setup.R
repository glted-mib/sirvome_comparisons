library(dplyr)
library(ggplot2)
library(gridExtra)

## setup root directory path
if(Sys.info()[4]=="DZ2626UTPURUCKE"){
  # tom epa windows
  sirv_root <- file.path("c:", "git", "sirvome_comparisons")
}
if(Sys.info()[4]=="LZ2626UTPURUCKE"){
  # tom epa windows
  sirv_root <- file.path("c:", "git", "sirvome_comparisons")
}
  
print(paste("Root directory location: ", sirv_root, sep=""))
  
sirv_data_in <- file.path(sirv_root, "data_in")
sirv_data_out <- file.path(sirv_root, "data_out")
sirv_graphics <- file.path(sirv_root, "graphics")

sirv_concs <- read.table(file.path(sirv_data_in,"/relative_concentration.tsv"), sep="\t", header=TRUE)
class(sirv_concs)
#View(sirv_concs)
dim(sirv_concs)
sirv_concs_df <- as.data.frame(sirv_concs[,2:169])
class(sirv_concs_df)
dim(sirv_concs_df)
#View(sirv_concs_df)

# transpose so that samples are rows
sirv_concs_df2 <- t(sirv_concs_df)
dim(sirv_concs_df2)

# get sample_names
sample_names <- as.data.frame(t(sirv_concs_df[1,]))
dim(sample_names)
colnames(sample_names)[1] <- "sample_names"

# add sample names to data frame
sirv_concs_df3 <- cbind(sample_names, sirv_concs_df2)
dim(sirv_concs_df3)
sirv_concs_df3$sample_names

# read metadata
sirv_metadata <- read.csv(file.path(sirv_data_in,"/sirv_metadata.csv"), stringsAsFactors = T)
dim(sirv_metadata)
colnames(sirv_metadata)[1] <- "sample_names"
#View(sirv_metadata)

sirv_metadata$sample_names
sirv_concs_df3$sample_names

# merge data frames
colnames(sirv_metadata)
dim(sirv_metadata)
colnames(sirv_concs_df3)
dim(sirv_concs_df3)
sirv_data <- merge(sirv_metadata, sirv_concs_df3, by.y="sample_names")
class(sirv_data)
dim(sirv_data)
View(sirv_data)


# 69 sirv genes
# 4 sequencers, 2 tissues, 168 samples
sirv_concs_t <- t(as.numeric(sirv_concs_df[1:69,2:169]))
dim(sirv_concs_t)
                  