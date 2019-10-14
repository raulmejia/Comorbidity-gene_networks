#!/bin/bash
sudo apt-get install xlsx2csv

my_folder=$1
#my_folder=~/Documentos/Data_Comorbility_networks/TABLAS\ DE\ LOS\ 3\ NODOS\ SELECCIONADOS/TABLA\ DEL\ NODO\ I25.8/I25.8\ INFO\ DEL\ NODO/

results_folder=$2
#results_folder=~/Documentos/Data_Comorbility_networks/Results
mkdir -p "$results_folder"

for names in "$my_folder"*.xlsx ; do
        xlsx2csv -d "tab" "$names" > $results_folder/"$(basename "$names" .xlsx).tsv"
	echo "$(basename "$names" .xlsx).tsv"
done;

# Example # sh Convert_all_xlsx_inside_a_folder_2_tsv_linux-debianoids.sh ~/Documentos/Data_Comorbility_networks/TABLAS\ DE\ LOS\ 3\ NODOS\ SELECCIONADOS/TABLA\ DEL\ NODO\ I25.8/I25.8\ INFO\ DEL\ NODO/ ~/Documentos/Data_Comorbility_networks/Results
