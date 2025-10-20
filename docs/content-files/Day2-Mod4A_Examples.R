# Module 4A - ormalization and Preprocessing

# install DESeq2
BiocManager::install("DESeq2")
# Load DESeq2
library(DESeq2)

# Create a DESeq2 dataset object
dds <- DESeqDataSet(airway, design = ~ dex)

# Run the DESeq pipeline
dds <- DESeq(dds) 

# Raw and ormalized counts 
# Normalized 
norm_counts <- counts(dds, normalized=TRUE)
head(norm_counts)

# Raw
norm_counts <- counts(dds, normalized=FALSE)
head(norm_counts)


# How to use VST in DESeq2
# creates a new transformed dataset
vsd <- vst(dds, blind=FALSE) # takes into account the experimental design
# Us the transformed expression matrix 
assay(vsd)[1:5, 1:5]


# Sample Clustering (Dendrogram/Heatmap)
# install pheatmap
BiocManager::install("pheatmap", force = T)

# Load pheatmap
library(pheatmap)

# Calculate sample-to-sample distances
sampleDists <- dist(t(assay(vsd)))

# Convert distances into a matrix
sampleDistMatrix <- as.matrix(sampleDists)

# Heatmap of distances between samples
pheatmap(sampleDistMatrix,
         annotation_col = as.data.frame(colData(vsd)[, "dex", drop=FALSE]),
         main = "Sample-to-sample distances")

# PCA with DESeq2 VST Data colored by treatment (dex)
plotPCA(vsd, intgroup="dex")




