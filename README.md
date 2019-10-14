# Comorbidity-gene_networks
Exploring the known relationships between comorbidities and genes through a network approach

----------
Example of use:   

### Q24.8  
first from xlsx to tsv:  
```sh Convert_all_xlsx_inside_a_folder_2_tsv_linux-debianoids.sh /path/to/your/excel/files/ /path/to/your/brandnew/tsvs```   

Then from tsv to jaccard results:  
```sh folder_tsvs_2_jaccard_graphs.sh ~/Documentos/Data_Comorbility_networks/tsv_complete/Q24.8/ /home/raulmejia/Documentos/Data_Comorbility_networks/tsv_columns_of_genes/Q24.8/ /home/raulmejia/Documentos/Data_Comorbility_networks/Jaccard/NODO_Q24.8/ NODE_Q24.8 7```  
