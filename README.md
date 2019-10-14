# Comorbidity-gene_networks
Exploring the known relationships between comorbidities and genes through a network approach

----------
## Example of use:   

first from xlsx to tsv:  
```sh Convert_all_xlsx_inside_a_folder_2_tsv_linux-debianoids.sh /path/to/your/excel/files/ /path/to/your/brandnew/tsvs```   

Then from tsv to jaccard results:  
```sh folder_tsvs_2_jaccard_graphs.sh /path/to/your/brandnew/tsvs /path/to/your/2ndcolumn(gene-symbols)/extracted/from/your/tsvs/  /path/to/store/your/Jaccard/results/ Label_for_this_job 21```

###### Note:   
the number 21 is the example of your pdf definition
