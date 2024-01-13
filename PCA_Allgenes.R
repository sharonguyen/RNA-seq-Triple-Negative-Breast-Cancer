setwd ('~/Desktop/RStuff/')

##Import Dataset from Excel
library(readxl)
FPKM_All <- read_excel("~/Desktop/FPKM_All.xlsx")
View(FPKM_All)

# Pseudocount (choose either 0.1 or 1.0)
pseudocount <- 0.1

# Add pseudocount to every value in the table
table_with_pseudocount <- FPKM_All + pseudocount

# Take the log10 of each value in the table
log10_transformed_table <- log10(table_with_pseudocount)

#Transpose Data
Transposed_FPKM <- t(log10_transformed_table)

#Create New Column
Transposed_FPKM_sample <- cbind(sample=c("Ntshrna231", "Ntshrna231", "MDM2_231", "MDM2_231", "MDM2_231", "DMSO231", "DMSO231", "PROTAC_231", "PROTAC_231", "PROTAC_231", "Ntshrna436", "Ntshrna436", "MDM2_436", "MDM2_436", "MDM2_436", "DMSO436", "DMSO436", "PROTAC436", "PROTAC436", "PROTAC436"), Transposed_FPKM)

#Install Packages
install.packages("ggfortify")
library(ggfortify)

#PCA Plot
autoplot(prcomp(Transposed_FPKM))

#PCA Plot w Colored Groups
autoplot(prcomp(Transposed_FPKM), data = Transposed_FPKM_sample, colour = "sample")


##Box-and-whisker plot using ggfortify
boxplot(log10_transformed_table)

