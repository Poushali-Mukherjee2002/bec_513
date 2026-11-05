#!/bin/bash

output_file="${1:-./sorted_bed_file_per_sample/sampleX_sorted.bed}"
> "$output_file"
cat selection.tsv |tr -d '\r'| while read -r chrom; do
    file_path="./${chrom}.bed"
    if [ -s "$file_path" ]; then
        sort -k2,2n -k3,3n "$file_path" >> "$output_file"
    fi
done


echo "Done!"
rm chr*.bed

