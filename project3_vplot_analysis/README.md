# Project 3: V-plot Generation and Analysis

## Overview
This project processes mapped genomic fragment data to generate a V-plot heatmap. The Python script reads standard input to calculate genomic offsets and fragment lengths, outputting a long-form matrix file (`real_data_vplot.tsv`), which Gnuplot then compiles into a high-resolution heatmap.

---

## Repository Structure

- **`scripts/`:** 
  - `project3_plot.py` — Python script that parses standard input, filters coordinates, and outputs long-form matrix data `(x, y, z)`[cite: 3, 4].
  - `vplot.gnu` — Gnuplot script configured with custom color palettes and ranges to render the heatmap.
- **`outputs/`:** Stores previously generated results, including the matrix file (`real_data_vplot.tsv`) and visualization plots inside `outputs/plots/`.

---

##  Where to Find the Output
All generated matrix tables and visualization figures are saved inside:
- **V-plot Matrix File:** `./output/real_data_vplot.tsv` or as mentioned in commandline argument while running the script
- **Generated Plots:** `./vplot1.png` 
- **Example Generated Plots:** `outputs/plots/` (e.g., `outputs/plots/vplot.png`)

---

## Prerequisites & Dependencies
Ensure you have the following installed in your environment:
- Python 3.x
- Gnuplot

---

## 🚀 How to Run the Pipeline

Follow these steps in your terminal from the project root directory:

### Step 1: Generate the Matrix File
Pipe your compressed BED dataset through the Python script using the structured paths to produce the long-form TSV matrix:

```bash
zcat ./data/mapped.bed.gz | python3 ./scripts/project3_plot.py > ./real_data_vplot.tsv

### Step 2: Render the V-plot Heatmap
Execute the Gnuplot script from your scripts directory to compile save the final image:
```bash
gnuplot -c ./scripts/vplot.gnu ./real_data_vplot.tsv


## Find the generated vplot in './vplot1.png'


