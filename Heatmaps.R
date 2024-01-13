setwd ('~/Desktop/RStuff/')

##Import Dataset from Excel
library(readxl)
FPKM_77 <- read_excel("~/Desktop/FPKM_77.xlsx")
View(FPKM_77)

library(readxl)
FPKM_GENE <- read_excel("~/Desktop/FPKM_GENE.xlsx")
View(FPKM_GENE)

# Pseudocount (choose either 0.1 or 1.0)
pseudocount <- 0.1

# Add pseudocount to every value in the table
table_with_pseudocount_77 <- FPKM_77 + pseudocount

# Take the log10 of each value in the table
log10_transformed_table_77 <- log10(table_with_pseudocount_77)

#Create Matrix
matrix_data <- as.matrix(log10_transformed_table_77)

#install packages
install.packages("BiocManager")
BiocManager::install("ComplexHeatmap")
force = TRUE
install.packages("ComplexHeatmap")
library(ComplexHeatmap)

#Print Heatmap
Heatmap(matrix_data)


