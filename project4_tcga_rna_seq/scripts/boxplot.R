library(tidyverse)

# 1. Read the raw TPM values from your files
stn_raw <- read.csv("./STN.tsv", header = FALSE)$V1
pt_raw <- read.csv("./PT.tsv", header = FALSE)$V1

# 2. Remove NAs and apply log2 transformation: log2(TPM + 1)
stn_log <- log2(na.omit(stn_raw) + 1)
pt_log <- log2(na.omit(pt_raw) + 1)

# 3. Create a combined data frame using dplyr
df_plot <- bind_rows(
  data.frame(Log2_TPM = stn_log, Sample_Type = "Solid Tissue Normal"),
  data.frame(Log2_TPM = pt_log, Sample_Type = "Primary Tumor")
) %>%
  mutate(Sample_Type = factor(Sample_Type, levels = c("Solid Tissue Normal", "Primary Tumor")))

# 4. Calculate sample sizes (n)
n_stn <- length(stn_log)
n_pt <- length(pt_log)

# 5. Calculate Mann-Whitney U (Wilcoxon) test p-value in base R
wilcox_res <- wilcox.test(stn_log, pt_log)
p_val <- wilcox_res$p.value

# Format the p-value string nicely
p_label <- if (p_val < 0.001) {
  sprintf("p = %.1e", p_val)
} else {
  sprintf("p = %.3f", p_val)
}

# 6. Generate the notched boxplot with custom colors mapped to Sample_Type
p <- ggplot(df_plot, aes(x = Sample_Type, y = Log2_TPM, fill = Sample_Type)) +
  geom_boxplot(notch = TRUE, color = "black", outlier.shape = 16, outlier.size = 1.5, alpha = 0.7) +
  scale_fill_manual(values = c("Solid Tissue Normal" = "#a6bddb", "Primary Tumor" = "#fc9272")) +
  theme_classic(base_size = 14) +
  labs(
    title = "Lung Adenocarcinoma",
    x = NULL,
    y = expression(Log[2]~(TPM + 1))
  ) +
  ylim(0, 10) +
  # Add the p-value manually using annotate
  annotate("text", x = 1.5, y = 8.8, label = p_label, size = 4.5) +
  # Add sample size annotations next to the boxes
  annotate("text", x = 0.8, y = 4.5, label = paste0("n = ", n_stn), angle = 90, size = 4) +
  annotate("text", x = 1.8, y = 5.0, label = paste0("n = ", n_pt), angle = 90, size = 4) +
  theme(
    legend.position = "none", # Hide legend since the x-axis labels already explain it
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    axis.text.x = element_text(color = "black", size = 12),
    axis.text.y = element_text(color = "black", size = 12),
    axis.title.y = element_text(face = "bold", size = 14)
  )

# Save the plot
ggsave("./nkx2_1_luad_boxplot_colour.png", plot = p, width = 6, height = 7, dpi = 300)
cat("Colorful boxplot successfully generated and saved as 'nkx2_1_luad_boxplot_colour.png'!\n")
