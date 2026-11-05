#!/bin/bash
SAMPLE_SHEET="${1}"
grep -E 'Gene Expression Quantification' "$SAMPLE_SHEET"| \
awk -F'\t' '/Primary Tumor/ {print "./" $1 "/" $2}'| \
while read filepath; do
    awk '/NKX2-1\t/ {print $7}' "$filepath"
done >./PT.tsv

grep -E 'Gene Expression Quantification' "$SAMPLE_SHEET"| \
awk -F'\t' '/Solid Tissue Normal/ {print "./" $1 "/" $2}'| \
while read filepath; do
    awk '/NKX2-1\t/ {print $7}' "$filepath"
done > ./STN.tsv
