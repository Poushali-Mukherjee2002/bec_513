# Project 1: Quick Bed Sort

A memory-efficient, high-performance pipeline written in **Python** and **Bash** to filter, split, sort, and merge BED files according to a custom chromosome selection order.

## Project Structure & Inputs


* **`scripts/`:** 
  * `sortnewcode.py` — Python script that reads raw BED files from standard input and streams them into individual chromosome-specific temporary files based on the selection list.
  * `newanalytics.sh` — Bash script that iterates through the selection file, sorts each chromosome file numerically by start and end coordinates, and merges them sequentially.

---

## Execution Workflow

Follow these steps in your terminal from the project root directory to run the complete pipeline from scratch:

### Step 1: Stream and Split Raw/Zipped BED Data
Because input data are compressed as `.gz` files, use **`zcat`** to decompress and stream them on the fly directly into your Python splitting script while taking the selction.tsv file path as argument:
```bash
zcat data/shuf.a.bed.gz data/shuf.b.bed.gz | python scripts/sortnewcode.py ./selection.tsv
(Note: If you are using uncompressed .bed files instead, you can use standard cat instead of zcat).

### Step 2: Sort and Merge Sequentially
Run the Bash automation script, while providing the desired output BED file path to sort each chromosome file (-k2,2n -k3,3n) and append them in the exact order specified by your selection file:
```bash
bash ./scripts/newanalytics.sh ./custom_sorted.bed

---

## Verification
To verify that the resulting output file matches the exact chromosome order defined in your selection criteria, run the following command:
```bash
cat ./custom_sorted.bed |awk '{print $1}'| uniq

## Zipped output file
If you want the output BED file to be gzipped, run the following command:
gzip custom_sorted.bed
