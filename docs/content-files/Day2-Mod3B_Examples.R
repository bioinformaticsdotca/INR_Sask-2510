# Module 3B - Bioconductor Backages and Data sets
# Install airway package
BiocManager::install("airway")

# load package and data
library("airway")
data("airway")   # loads the dataset into your environment
airway

# Explore airway package
ex <- assay(airway)[1:5, 1:5]   # expression counts
cols <- colData(airway)[1:5, ]    # sample metadata
rows <- rowData(airway)[1:5, ]    # gene metadata


# Hands on 
# Subsetting treated vs untreated
treated <- airway[, airway$dex == "trt"]
untreated <- airway[, airway$dex == "untrt"]

dim(treated)
dim(untreated)

# Count treated vs untreated
table(airway$dex)

# Extract samples from a specific cell line
subset_cell <- airway[, airway$cell == "N061011"]

# Get number of genes
nrow(airway)

# ExperimentHub Demo
# Load ExperimentHub
library(ExperimentHub)

# Create a hub object
eh <- ExperimentHub()

# Search for RNA-seq datasets
query(eh, "RNA-seq")

# Access a specific dataset by ID (example)
eh[["EH1234"]]   # Loads dataset into R



# AnnotationHub Demo
# Load AnnotationHub
library(AnnotationHub)
library("rtracklayer")
# Create a hub object
ah <- AnnotationHub()

# Search for human genome resources
query(ah, "Homo sapiens")

# Access an annotation dataset by ID (example)
ah[["AH83281"]]   # Loads GRCh38 GTF annotation into R

# org.Hs.eg.db Demo
# Install packages 
BiocManager::install("AnnotationDbi")
BiocManager::install("org.Hs.eg.db")

# load packages
library(org.Hs.eg.db)
library(AnnotationDbi)

ids <- rownames(airway)[1:5]
mapIds(org.Hs.eg.db,
       keys = ids,
       keytype = "ENSEMBL",
       column = "SYMBOL")


