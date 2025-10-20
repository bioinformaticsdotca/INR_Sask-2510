# Module 3B - Tasks

# Task 1: Take the first 20 genes from airway. Map ENSEMBL IDs → gene symbols. 
# Retrieve gene descriptions.
library(airway)
data("airway")

library(org.Hs.eg.db)
library(AnnotationDbi)

# Get first 20 ENSEMBL IDs from airway
ids20 <- rownames(airway)[1:20]

# Map ENSEMBL → Gene Symbol
symbols <- mapIds(org.Hs.eg.db,
                  keys = ids20,
                  keytype = "ENSEMBL",
                  column = "SYMBOL")

# Map ENSEMBL → Full Gene Name
descriptions <- mapIds(org.Hs.eg.db,
                       keys = ids20,
                       keytype = "ENSEMBL",
                       column = "GENENAME")

# Combine into a data frame
annotated20 <- data.frame(ENSEMBL_ID = ids20,
                          Symbol = symbols,
                          Description = descriptions)

head(annotated20)


# Task 2: Subset airway to treated samples only. Select the first 5 genes. 
# Annotate them with symbols + full names.
# Subset treated samples
treated <- airway[, airway$dex == "trt"]

# Get first 5 ENSEMBL IDs from treated dataset
ids5 <- rownames(treated)[1:5]

# Map ENSEMBL → Symbol
symbols5 <- mapIds(org.Hs.eg.db,
                   keys = ids5,
                   keytype = "ENSEMBL",
                   column = "SYMBOL")

# Map ENSEMBL → Gene Name
names5 <- mapIds(org.Hs.eg.db,
                 keys = ids5,
                 keytype = "ENSEMBL",
                 column = "GENENAME")

# Combine results
annotated5 <- data.frame(ENSEMBL_ID = ids5,
                         Symbol = symbols5,
                         Full_Name = names5)

annotated5

