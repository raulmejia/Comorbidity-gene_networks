#!/bin/bash
# The first argument in the folder path to your tsv files
# The second argument is the folder where you want to save the intermediate files of list of genes
# Third argument is where you want to save the results

my_tsv_folder=$1
#my_folder=/home/raulmejia/Documentos/Data_Comorbility_networks/Results/

list_of_genes_folder=$2
#results_folder=/home/raulmejia/Documentos/Data_Comorbility_networks/Results_columns_of_genes

folder_jaccard=$3

my_label=$4

pdf_definition=$5

mkdir -p "$list_of_genes_folder"

for names in "$my_tsv_folder"*.tsv ; do
        awk -F '\t' '{print $2}' "$names" > $list_of_genes_folder/"$(basename "$names" .tsv).genecolumn.tsv"
done;

ls $list_of_genes_folder

Rscript ./Path_genelist_in_tsv_2_JaccardMatrix.R $list_of_genes_folder $folder_jaccard $my_label $pdf_definition
