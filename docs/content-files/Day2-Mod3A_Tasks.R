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



