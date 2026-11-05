
import sys
import gzip
filename1 = sys.argv[1]
filename2 = sys.argv[2]
def open_bed_file(path):
  if path.endswith(".gz"):
    return gzip.open(path, "rt")  
  else:
    return open(path, "r")

length_counts = {}

# Open your query file and read it line by line
with open_bed_file(filename1) as f:
    for line in f:
        if not line.strip():
            continue
 
        cols = line.strip().split()

  
        start = int(cols[1])
        end = int(cols[2])
        length = end - start

   
        if length in length_counts:
            length_counts[length] += 1
        else:
            length_counts[length] = 1

total_query_count = sum(length_counts.values())

# 2. Calculate normalized frequency for each length bin
query_norm = {
    length: count / total_query_count
    for length, count in length_counts.items()
}





ref_length_dict={}
with open(filename2, "r") as r:
  for line1 in r:
    if not line.strip():
      continue

   
    cols1 = line1.strip().split()

   
    ref_length = int(cols1[0])
    ref_freq = float(cols1[1])
    ref_length_dict[ref_length]=ref_freq

raw_ratios = {
    length: ref_length_dict.get(length, 0) / q_freq
    for length, q_freq in query_norm.items()
}


max_ratio = max(raw_ratios.values())


scaling_factor = 1.0 / max_ratio if max_ratio > 1.0 else 1.0

#Reference scaled down
retention_probs = {
    length: ratio * scaling_factor for length, ratio in raw_ratios.items()
}
import random
random.seed(42)

# Open the original query file for reading and a new file for writing your rescaled output
with open("./rescaled_output.bed", "w") as outfile:
  for line in sys.stdin:
    if not line.strip():
      continue

    cols = line.strip().split()
  
    start = int(cols[1])
    end = int(cols[2])
    length = end - start


    prob = retention_probs.get(length, 0.0)

    # Roll a random number between 0.0 and 1.0 
    if random.random() <= prob:
      outfile.write(line)

print("Rescaling complete Check rescaled_output.bed.")
# --- Generate a histogram file for Gnuplot ---
rescaled_counts = {}
with open("./rescaled_output.bed", "r") as f:
  for line in f:
    cols = line.strip().split()
    start = int(cols[1])
    end = int(cols[2])
    length = end - start
    rescaled_counts[length] = rescaled_counts.get(length, 0) + 1

total_rescaled = sum(rescaled_counts.values())

# Write normalized frequencies to 'rescaled.hist'
with open("./rescaled.hist", "w") as out:
  for length, count in sorted(rescaled_counts.items()):
    norm_freq = count / total_rescaled if total_rescaled > 0 else 0
    out.write(f"{length}\t{norm_freq}\n")

print("Generated rescaled.hist.")


