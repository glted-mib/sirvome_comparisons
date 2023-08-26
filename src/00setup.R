library(dplyr)
library(ggplot2)
library(gridExtra)
library(tidyr)
library(scales)

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
sirv_concs$transcript_id
dim(sirv_concs)

# just get teh numeric values before transposing
sirv_concs_df <- as.data.frame(sirv_concs[,2:169])
class(sirv_concs_df)
dim(sirv_concs_df)
#View(sirv_concs_df)

# transpose so that samples are rows
sirv_concs_df2 <- t(sirv_concs_df)
dim(sirv_concs_df2)

# get sample_names
sample_names <- as.data.frame(rownames(sirv_concs_df2))
dim(sample_names)
colnames(sample_names)[1] <- "sample_names"
sample_names

# add sample names to data frame
sirv_concs_df3 <- cbind(sample_names, sirv_concs_df2)
dim(sirv_concs_df3)
sirv_concs_df3$sample_names
colnames(sirv_concs_df3)[2:70] <- sirv_concs$transcript_id
colnames(sirv_concs_df3)

# read metadata
sirv_metadata <- read.csv(file.path(sirv_data_in,"/sirv_metadata.csv"), stringsAsFactors = T)
dim(sirv_metadata)
colnames(sirv_metadata)[1] <- "sample_names"
#View(sirv_metadata)

sirv_metadata$sample_names
sirv_metadata$batch
sirv_concs_df3$sample_names

# merge data frames for concentrations and metadata
colnames(sirv_metadata)
dim(sirv_metadata)
#View(sirv_metadata)
colnames(sirv_concs_df3)
dim(sirv_concs_df3)
sirv_data <- merge(sirv_metadata, sirv_concs_df3, by.y="sample_names")
class(sirv_data)
dim(sirv_data)
#View(sirv_data)


                  