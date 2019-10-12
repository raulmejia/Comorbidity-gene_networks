# This program makes a matrix with jaccard index as elements
#

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

###########################################
### Data given by the user
###########################################
# Path_to_your_Excelfiles <-c("../Data/expMatrix_TCGA_cBioPortal_no_males_withindicator.txt") ; Path_to_your_PhenoData <-c("../Data/Labels_Controls_and_Normal_separated_TCGA.txt") ; Path_of_Results<-c("../Results/Splited_SubMatrices_with_controls/") ; Title_of_Results <- c("TCGA"); colname_of_PhenoData_to_split<-c("Labels") ; values_to_use_for_split<- c("Control") 
Path_to_your_Excelfiles <- args[1]
Path_to_your_PhenoData <- args[2]

#######################
Path_to_your_Excelfiles<- "~/Documents/Data-Comorbidity-gene_networks/"
source_path <- paste("ls",Path_to_your_Excelfiles)

dir(Path_to_your_Excelfiles)

paste0(Path_to_your_Excelfiles , dir(Path_to_your_Excelfiles))
