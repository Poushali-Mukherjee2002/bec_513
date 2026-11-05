import sys
selection_file = sys.argv[1]
with open(selection_file, "r") as f:
    selection_list = [line.strip() for line in f if line.strip()]

fp_dict = {chrom: open(f"{chrom}.bed", "w") for chrom in selection_list}
for line in sys.stdin:
    chrom=line.split()[0]
    if chrom in fp_dict:
        fp_dict[chrom].write(line)
for fp in fp_dict.values():
    fp.close()

