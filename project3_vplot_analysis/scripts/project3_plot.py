import sys
from collections import defaultdict

counts = defaultdict(int)

for line in sys.stdin:
    col = line.strip().split()
    
    anchor_center = (int(col[2]) + int(col[3])) / 2
    frag_center = (int(col[8]) + int(col[9])) / 2
    offset = int(round(frag_center - anchor_center))   # 1 bp bins
    frag_len = int(col[11])
    count = int(col[0])
    if -500 <= offset <= 500 and 30 <= frag_len <= 200:
        counts[(offset, frag_len)] += count

for x in range(-500, 501):
    for y in range(30,201 ):
        print(f"{x}\t{y}\t{counts[(x, y)]}")
    print()          # blank line once per x block

