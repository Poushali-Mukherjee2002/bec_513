# Project 4: TCGA RNA-seq Data Analysis (NKX2-1 Expression)

## Overview
This project processes TCGA RNA-seq datasets for Lung Adenocarcinoma (LUAD) to quantify and compare the expression profile of the biomarker gene **NKX2-1** across **Primary Tumor (PT)** and **Solid Tissue Normal (STN)** conditions.

---
## INPUT FILES
- **the compressed raw counts archive (`tcga_data.tar.gz`)
- sample metadata (`gdc_sample_sheet.tsv`).

---

## Repository Structure
- **`scripts/`:** 
  - `code_NKX21.sh` — Shell script to parse expression values (`tpm_unstranded`) for NKX2-1 across sample files.
  - `boxplot.R` — R script utilizing `tidyverse` / `ggplot2` to render the comparative $\log_2(\text{TPM} + 1)$ boxplot.
- **`outputs/`:** Stores previously generated expression tables (`PT.tsv`, `STN.tsv`) and visual plots inside `outputs/plots/` as examples.

---

##  Where to Find the Output
- **All the current outputs would be saved in present working directory**

All previously generated example tables and visualization figures are saved inside the **`outputs/`** directory:
- ** Previously Generated Processed Data Tables:** `outputs/PT.tsv`, `outputs/STN.tsv` as examples
- ** Previously Generated Visualization Plots:** `outputs/plots/` (e.g., `outputs/plots/nkx2_1_luad_boxplot_colour.png`), as examples
 All the current outputs would be saved in present working directory
---

## Prerequisites & Dependencies
Ensure you have the following installed in your Linux/Unix environment:
- **Bash shell** utilities (`tar`, `awk`, `grep`, `sed`)
- **R** (version 4.0 or higher)
- **R Packages**: `tidyverse` (`ggplot2`, `dplyr`, `readr`)

```R
install.packages("tidyverse")

---


## How to Run the Pipeline
Follow these steps in your terminal from the project root directory:

### Step 1: Extract the Raw Data
Unpack the TCGA data archive into your** present working directory** to populate the raw count directories:
```bash
tar -zxvf ./tcga_data.tar.gz -C ./

### Step 2: Run the Data Processing Shell Script
Execute the shell script to parse the gene expression profiles and extract tpm_unstranded values for NKX2-1, while providing the filepath of the samplesheet .tsv file as argument as shown:
## NOTE: Kindly make sure your data is in the **present working directory** before running the code

```bash
bash scripts/code_NKX21.sh ./data/gdc_sample_sheet.tsv

### Step 3: Generate the Boxplot Visualization
Run the R script to process the extracted tables and render the comparative expression boxplot:

```bash
Rscript ./scripts/boxplot.R

