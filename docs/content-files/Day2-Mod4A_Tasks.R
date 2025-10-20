# Module 4A - Tasks
# Pretasks
# Load DESeq2
library(DESeq2)
library(airway)
data("airway")

# Create a DESeq2 dataset object
dds <- DESeqDataSet(airway, design = ~ dex)

# Run the DESeq pipeline
dds <- DESeq(dds) 

# creates a new transformed dataset
vsd <- vst(dds, blind=FALSE) # takes into account the experimental design


# Task 1: Variance check (top variable genes)
# Calculate variance for each gene
geneVars <- rowVars(assay(vsd))

# Top 10 most variable genes
top10 <- head(order(geneVars, decreasing=TRUE), 10)
rownames(vsd)[top10]

# Task 2: Custom PCA on top 500 genes
library(ggplot2)

# Select top 500 variable genes
top500 <- head(order(geneVars, decreasing=TRUE), 500)
mat <- assay(vsd)[top500, ]

# Run PCA
pca <- prcomp(t(mat), scale. = TRUE)

# Create data frame for plotting
pca_df <- as.data.frame(pca$x)
pca_df$dex <- colData(vsd)$dex

# PCA plot
ggplot(pca_df, aes(x=PC1, y=PC2, color=dex)) +
  geom_point(size=3) +
  labs(title="PCA on Top 500 Variable Genes")

# Task 3: Challenge: Add cell line
pca_df$cell <- colData(vsd)$cell

ggplot(pca_df, aes(x=PC1, y=PC2, color=dex, shape=cell)) +
  geom_point(size=3) +
  labs(title="PCA: Treatment (color) vs Cell Line (shape)")

