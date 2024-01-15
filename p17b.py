
from heapq import heappush, heappop

MAX = 2 ** 31

with open('input17.txt') as f:
    map = [ [ int(s) for s in l.rstrip() ] for l in f.readlines() ]
w = len(map[0])
h = len(map)

# le premier nb est la distance si on y arrive horizontalement
n = [ [ [MAX, MAX] for _ in range(w) ] for _ in map ]

q = []
heappush(q, [0, 0, 0, 0])
heappush(q, [0, 1, 0, 0])

while q:
    cur, d, x, y = heappop(q)
    # d indique la direction à suivre (0 horiz, 1 vert)
    dx = 1 - d
    dy = d
    nd = 1 - d
    for sens in [1, -1]:
        tmpcur = cur
        for lg in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]:
            nx = x + dx * sens * lg
            ny = y + dy * sens * lg
            if not (0 <= nx < w and 0 <= ny < h):
                break
            tmpcur += map[ny][nx]
            if lg >= 4 and tmpcur < n[ny][nx][d]:
                n[ny][nx][d] = tmpcur
                heappush(q, [tmpcur, nd, nx, ny])
    
print(min(n[h-1][w-1]))

# 1165