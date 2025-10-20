# Module 4B - Bioconductor Backages and Data sets

# Install airway package
BiocManager::install("airway")
library(airway)
library(DESeq2)

# DGE Analysis 
dds <- DESeqDataSet(airway, design = ~ dex)
dds <- DESeq(dds)

# Extract DGE results
res <- results(dds)
head(res)

# Filter significant genes
sig_res <- res[which(res$padj < 0.05), ]
head(sig_res)
summary(sig_res)


# Visualization of DGE Results

# Load required packages
library(DESeq2)
library(ggplot2)

# Run DESeq2 analysis
dds <- DESeqDataSet(airway, design = ~ dex)
dds <- DESeq(dds)
res <- results(dds)

# Convert to data frame for plotting
res_df <- as.data.frame(res)

# Remove rows with missing p-values or fold change (optional but helps avoid warnings)
res_df <- na.omit(res_df)

# Create a new column indicating regulation direction
res_df$Regulation <- "Not significant"
res_df$Regulation[res_df$log2FoldChange > 1 & res_df$padj < 0.05] <- "Upregulated"
res_df$Regulation[res_df$log2FoldChange < -1 & res_df$padj < 0.05] <- "Downregulated"

# Volcano plot
ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), color = Regulation)) +
  geom_point(alpha = 0.6, size = 1.5) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "gray40") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "gray40") +
  scale_color_manual(values = c("Upregulated" = "red",
                                "Downregulated" = "blue",
                                "Not significant" = "gray70")) +
  labs(title = "Volcano Plot: Treated vs Untreated",
       x = "log2 Fold Change",
       y = "-log10(Adjusted p-value)",
       color = "Regulation") +
  theme_minimal()

