setwd ('~/Desktop/RStuff/')

##Import Dataset from Excel
library(readxl)
FPKM_GENE <- read_excel("~/Desktop/FPKM_GENE.xlsx")
View(FPKM_GENE)

# Pseudocount (choose either 0.1 or 1.0)
pseudocount <- 0.1

# Add pseudocount to every value in the table
table_with_pseudocount_GENE <- FPKM_GENE + pseudocount

# Take the log10 of each value in the table
log10_transformed_table_GENE <- log10(table_with_pseudocount_GENE)

#Create New Column
FPKM_GENE_sample <- cbind(sample=c("TRAF1", "GADD45A", "TNFAIP3", "MYB", "EGR2", "MMP19", "CXCL3", "CXCL8"), log10_transformed_table_GENE)

# Set the sample names as row names
rownames(FPKM_GENE_sample) <- FPKM_GENE_sample$sample
FPKM_GENE_sample$sample <- NULL  # Remove the redundant 'sample' column

#Create Matrix
matrix_data_GENE <- as.matrix(FPKM_GENE_sample)

#install packages
install.packages("BiocManager")
BiocManager::install("ComplexHeatmap")
force = TRUE
install.packages("ComplexHeatmap")
library(ComplexHeatmap)

#Print Heatmap
Heatmap(matrix_data_GENE, row_names_side = "left", show_row_names = TRUE)
