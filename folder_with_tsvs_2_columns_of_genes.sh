#!/bin/bash
# The first argument in the path to your tsv files
# The second argument is the path where you want to save the resulting tsv files

my_folder=$1
#my_folder=/home/raulmejia/Documentos/Data_Comorbility_networks/Results/

results_folder=$2
#results_folder=/home/raulmejia/Documentos/Data_Comorbility_networks/Results_columns_of_genes

mkdir -p "$results_folder"

for names in "$my_folder"*.tsv ; do
        awk -F '\t' '{print $2}' "$names" > $results_folder/"$(basename "$names" .tsv).genecolumn.tsv"
done;

