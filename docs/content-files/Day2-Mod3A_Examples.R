# Tasks Module 3A - Examples
# Day 2 Module 3A

# Install BiocManager if not installed
install.packages("BiocManager")

# Install a package, e.g. GenomicRanges
BiocManager::install("GenomicRanges")

# Load a package
library(GenomicRanges)
library(SummarizedExperiment)

# Create simple SummarizedExperiment
counts <- matrix(rpois(20, 10), ncol=4)
colData <- DataFrame(condition=c("A","A","B","B"))
rowData <- DataFrame(gene=letters[1:5])

se <- SummarizedExperiment(assays=list(counts=counts),
                           colData=colData,
                           rowData=rowData)

se

# Demo 2: ALL dataset
BiocManager::install("ALL")
library(ALL)
data(ALL)
ALL

# Hands on tasks
# Extract and preview sample (patient) metadata
meta <- pData(ALL)
head(meta)   # first 6 rows

# Gender distribution
table(meta$sex)

# Mean age (ignoring missing values)
amean(meta$age, na.rm = TRUE)


# Visualization in Bioconductor
boxplot(exprs(ALL)[,1:10], las=2, main="Expression values (first 10 samples)")


# Load All package and data
# BiocManager::install("ALL")
library(SummarizedExperiment)
library(ALL)
data(ALL)

# Subset patients < 20
young_patients <- ALL[, pData(ALL)$age < 20]
dim(young_patients)

# Count patients by Immunophenotype (BT)
barplot(table(pData(ALL)$BT), main="Patients by Immunophenotype (BT)", ylab="Patients", xlab="Immunophenotype (BT)")

# PCA on first 50 genes
expr <- exprs(ALL)[1:50, ]
pca <- prcomp(t(expr), scale. = TRUE)
plot(pca$x[,1:2], col = as.factor(pData(ALL)$BT),
     pch=19, main="PCA of 50 genes")


#Boxplot of Age by Sex
boxplot(age ~ sex, data = pData(ALL),
        main="Age Distribution by Sex", xlab="Sex", ylab="Age")

# Challenge (Filter missing age & re-run PCA)
ALL_clean <- ALL[, !is.na(pData(ALL)$age)]
expr_clean <- exprs(ALL_clean)[1:50, ]
pca_clean <- prcomp(t(expr_clean), scale. = TRUE)
plot(pca_clean$x[,1:2], col = as.factor(pData(ALL_clean)$BT),
     pch=19, main="PCA after removing NA ages")


