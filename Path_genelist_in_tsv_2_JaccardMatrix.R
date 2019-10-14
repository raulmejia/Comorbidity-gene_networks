# This program makes a matrix with jaccard index as elements
# WARNING: it should be ONLY xlsx files inside otherwhise the program will brake
#################################################
### Loading and installing required libraries
#################################################
args <- commandArgs(trailingOnly = TRUE)
if (!require("BiocManager")) {
  install.packages("BiocManager", ask =FALSE)
  library("BiocManager")
}
if (!require("GOexpress")) {
  BiocManager::install("GOexpress", ask =FALSE)
  library("GOexpress")
}
if (!require("readxl")) {
  install.packages("readxl")
  library("readxl")
}
if (!require("sets")) {
  install.packages("sets")
  library("sets")
}
if (!require("ggplot2")) {
  install.packages("ggplot2")
  library("ggplot2")
}

if (!require("reshape2")) {
  install.packages("reshape2")
  library("reshape2")
}

#################################################
### Functions to be used
#################################################
myjaccard <- function(A, B){
  I <- length(intersect(A, B))
  results <- I/(length(A)+length(B)-I)
  return(results)
}
###########################################
### Data given by the user
###########################################
# Path_to_your_files <- c("/home/raulmejia/Documentos/Data_Comorbility_networks/tsv_columns_of_genes") ; Path_to_Results <- c("/home/raulmejia/Documentos/Data_Comorbility_networks/Jaccard/NODO_I25.8_2/"); my_label <- "NODE_I25.8" ; pdf_definition_w_h = 35
Path_to_your_files <- args[1] # the path to your tsv files
Path_to_Results <- args[2] # Path were you wan to save the jaccard matrix and graph
my_label <- args[3] # a label for your results
pdf_definition_w_h <- args[4]  # more definition more legible (smaller) legends in the graph
#######################
File_names <- dir(normalizePath(Path_to_your_files))
your_files <- paste0( normalizePath(Path_to_your_files),"/" , File_names  )

your_files <- your_files[grepl(".tsv",your_files)] # protection against folder which contain some files/folders without .tsv extention

list_of_dfs <- list()
for( k in 1:length(your_files) ){
  list_of_dfs[[k]] <- read.table(your_files[k], stringsAsFactors = FALSE, skip = 1 )
}
names( list_of_dfs ) <- File_names


list_of_genes_per_file <- list()
for( w in File_names){
  list_of_genes_per_file[[w]] <- unlist( strsplit( unique( as.character(as.matrix(list_of_dfs[w][[1]]) ) ) , split='|', fixed=TRUE))
}

# eliminating duplicated genes
for( z in 1:length(list_of_genes_per_file)){
  list_of_genes_per_file[[z]] <- unique(list_of_genes_per_file[[z]]) 
}

# calculating the jaccard index
jaccard_matrix <-matrix( rep(NA,length(list_of_genes_per_file)**2), nrow = length(list_of_genes_per_file),ncol=length(list_of_genes_per_file))

for( z in 1:length(list_of_genes_per_file)){
  for( x in 1:length(list_of_genes_per_file)){
    jaccard_matrix[z,x] <- myjaccard( list_of_genes_per_file[[z]] , list_of_genes_per_file[[x]] )
  }
}

colnames(jaccard_matrix) <- substr(names(list_of_genes_per_file),1,5)
rownames(jaccard_matrix) <- substr(names(list_of_genes_per_file),1,5)

##################################
############ Save results
##################################
pdf_definition_w_h <- as.numeric(pdf_definition_w_h)
Norm_Path_Results <- normalizePath(Path_to_Results)
dir.create(Norm_Path_Results , recursive = TRUE)

melted_jaccard_matrix <- melt(jaccard_matrix)
pdf(paste0(Norm_Path_Results, my_label,"jaccard_matrix.pdf"), width =35, height = 35 )
ggplot(data = melted_jaccard_matrix, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() +labs(title=paste0("Matrix of jaccard index of " ,my_label), x ="ICD10 codes", y = "ICD10 codes", fill = "Jaccard index") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
dev.off()

write.table(jaccard_matrix, file= paste0(Norm_Path_Results,"/", my_label,"jaccard_matrix.tsv"), sep="\t", quote=FALSE, row.names = TRUE, col.names = TRUE)
