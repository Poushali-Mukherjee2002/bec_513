# BEC-513: Computational Biology Projects

This repository contains bioinformatics analysis pipelines, data automation scripts, and quantitative visualization tools developed for the **BEC-513** course.

---

##  Repository Structure

* **[`project1_quick_bed_sort/`](./project1_quick_bed_sort/)** — High-performance pipeline in Python & Bash to stream, split, sort, and merge compressed BED files according to a custom chromosome selection order.
* **[`project2_rescale_to_reference/`](./project2_rescale_to_reference/)** — Fragment length frequency distribution rescaling workflow and statistical distribution plotting using Python and Gnuplot.
* **[`project3_vplot_analysis/`](./project3_vplot_analysis/)** — Cell-free DNA (cfDNA) V-plot density matrix heatmap generator using Python data grouping and Gnuplot `pm3d`.
* **[`project4_tcga_rna_seq/`](./project4_tcga_rna_seq/)** — TCGA Lung Adenocarcinoma (LUAD) RNA-seq expression analysis pipeline extracting *NKX2-1* metrics and rendering comparative boxplots via `ggplot2`.

---

##  Requirements & Tools

* **Languages:** Python, R, Shell / Bash
* **Plotting & Visualization:** `gnuplot`, R (`tidyverse`, `ggplot2`, `dplyr`)
* **Core Utilities:** `zcat`, `awk`, `tar`, `sed`, `grep`

---

##  Usage

Each project directory contains a self-contained pipeline with specific execution instructions, sample datasets, and scripts. Navigate to any individual project directory to view its dedicated documentation and running steps.
