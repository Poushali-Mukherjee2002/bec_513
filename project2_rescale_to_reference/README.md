# Project 2: Rescale to Reference

## Overview
This project focuses on genomic fragment length analysis by probabilistic down-sampling. The goal is to take a query dataset (`query.bed.gz`) and rescale its fragment length distribution to match a target reference distribution (`reference.hist`).

---

## Repository Structure
- **`scripts/`:** 
  - `project_2_code.py` — Python script handling the probabilistic sampling and rescaling pipeline.
  - `project_2_plot.gnu` — Gnuplot script for compiling the comparative distribution plot.
- **`outputs/`:** Stores previously generated results including `rescaled_output.bed`, intermediate histograms (`rescaled.hist`), and visualization plots inside `outputs/plots/`.

---

## Prerequisites & Dependencies
Ensure you have the following tools installed in your environment:
- Python 3.x
- Gnuplot

---
##  Where to Find the Output
** The output plot is saved in './fragment_length_distribution_rescaled_data.png'. The other generated files would be saved in current working directory, or as mentioned as argument while running the scripts. **

All  previously generated results, tables, and visualization plots are saved in:
- **Final Rescaled BED File:** `./rescaled_output.bed`
- **Intermediate Histogram Data:** `./rescaled.hist`
- **Visual Plots & Figures:** `./fragment_length_distribution_rescaled_data.png` 

---

## How to Run the Pipeline

Follow these steps in your terminal from the project root directory:

### Step 1: Run the Python Rescaling Script
Process the compressed query BED file through the Python script using the structured file paths to generate the rescaled output, providing the file paths of the compressed BED file and the reference.hist files as the first and second argument respectively:

```bash
zcat ./data/query.bed.gz | python3 ./scripts/project_2_code.py ./data/query.bed.gz ./data/reference.hist > ./rescaled_output.bed

### Step 2: Generate the Comparison Plot
Run the Gnuplot script from the scripts directory to compile and save the final distribution plot, providing the reference.hist file path and the file path of rescaled.hist (obtained from running the python scripts) as the first and second argument respectively :
```bash
gnuplot -c ./scripts/project_2_plot.gnu ./data/reference.hist ./outputs/rescaled.hist


## You may find your output plot in './fragment_length_distribution_rescaled_data.png'
