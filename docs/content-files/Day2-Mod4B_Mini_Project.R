# Day 2-Module 4B - Mini Project

# Task 1: Load Required Libraries and Dataset

# Load packages
library(DESeq2)
library(airway)
library(ggplot2)
library(org.Hs.eg.db)
library(AnnotationDbi)
library(pheatmap)

# Load data
data("airway")

# Inspect dataset
airway


# Task 2: Preprocessing and Normalization
# Create DESeq2 object
dds <- DESeqDataSet(airway, design = ~ dex)

# Run the DESeq2 pipeline (includes normalization)
dds <- DESeq(dds)

# Variance Stabilizing Transformation
vsd <- vst(dds, blind = FALSE)


# Task 3: Differential Expression Analysis
# Extract DE results
res <- results(dds)
summary(res)

# Filter significant genes (adjusted p < 0.05)
sig_res <- res[which(res$padj < 0.05), ]

# Order by log2 fold change
sig_res <- sig_res[order(sig_res$log2FoldChange, decreasing = TRUE), ]

# Show top results
head(sig_res)


# Task 4: Annotate Significant Genes
# Take top 20 genes
top_genes <- rownames(sig_res)[1:20]

# Map to gene symbols and names
symbols <- mapIds(org.Hs.eg.db,
                  keys = top_genes,
                  keytype = "ENSEMBL",
                  column = "SYMBOL")
names <- mapIds(org.Hs.eg.db,
                keys = top_genes,
                keytype = "ENSEMBL",
                column = "GENENAME")

annotated <- data.frame(ENSEMBL = top_genes,
                        Symbol = symbols,
                        Name = names)
head(annotated)

# Task 5: Visualization
# A: PCA
plotPCA(vsd, intgroup = "dex")


# B: Volcano plot
res_df <- as.data.frame(res)
res_df <- na.omit(res_df)
res_df$Regulation <- "Not significant"
res_df$Regulation[res_df$log2FoldChange > 1 & res_df$padj < 0.05] <- "Upregulated"
res_df$Regulation[res_df$log2FoldChange < -1 & res_df$padj < 0.05] <- "Downregulated"

ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), color = Regulation)) +
  geom_point(alpha = 0.6, size = 1.5) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "gray40") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "gray40") +
  scale_color_manual(values = c("Upregulated" = "red",
                                "Downregulated" = "blue",
                                "Not significant" = "gray70")) +
  labs(title = "Volcano Plot: Treated vs Untreated",
       x = "log2 Fold Change", y = "-log10(Adjusted p-value)") +
  theme_minimal()

# C: Heatmap of Top Variable Genes
topVarGenes <- head(order(rowVars(assay(vsd)), decreasing = TRUE), 30)
pheatmap(assay(vsd)[topVarGenes, ],
         scale = "row",
         annotation_col = as.data.frame(colData(vsd)[, "dex", drop=FALSE]),
         main = "Top 30 Variable Genes")

# D: Optional Challenge (Barplot of top 10 upregulated genes)
top_up <- head(sig_res[order(sig_res$log2FoldChange, decreasing = TRUE), ], 10)
barplot(top_up$log2FoldChange, names.arg = rownames(top_up),
        las = 2, col = "tomato", main = "Top 10 Upregulated Genes",
        ylab = "log2 Fold Change")



