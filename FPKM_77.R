setwd ('~/Desktop/RStuff/')

##Import Dataset from Excel
library(readxl)
FPKM_77 <- read_excel("~/Desktop/FPKM_77.xlsx")
View(FPKM_77)

# Pseudocount (choose either 0.1 or 1.0)
pseudocount <- 0.1

# Add pseudocount to every value in the table
table_with_pseudocount_77 <- FPKM_77 + pseudocount

# Take the log10 of each value in the table
log10_transformed_table_77 <- log10(table_with_pseudocount_77)

#Transpose Data
Transposed_FPKM_77 <- t(log10_transformed_table_77)

#Create New Column
Transposed_FPKM_77_sample <- cbind(sample=c("Ntshrna231", "Ntshrna231", "MDM2_231", "MDM2_231", "MDM2_231", "DMSO231", "DMSO231", "PROTAC_231", "PROTAC_231", "PROTAC_231", "Ntshrna436", "Ntshrna436", "MDM2_436", "MDM2_436", "MDM2_436", "DMSO436", "DMSO436", "PROTAC436", "PROTAC436", "PROTAC436"), Transposed_FPKM_77)

#Install Packages
install.packages("ggfortify")
library(ggfortify)

#PCA Plot
autoplot(prcomp(Transposed_FPKM_77))

#PCA Plot w Colored Groups
autoplot(prcomp(Transposed_FPKM_77), data = Transposed_FPKM_77_sample, colour = "sample")

##MAKING DENDROGRAM

# Perform hierarchical clustering with Euclidean distance
hc <- hclust(dist(Transposed_FPKM_77, method = "euclidean"))

# Plot the dendrogram
plot(hc, main = "Dendrogram of Transposed FPKM_77 Data (Euclidean Distance)", xlab = "Samples", sub = NULL)

