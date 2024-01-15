
# directions :
# 0 from left to right
# 1 from top to bottom
# 2 from right to left
# 3 from bottom to top

def forward(direction, x, y):
    if direction == 0:
        return x + 1, y
    elif direction == 1:
        return x, y + 1
    elif direction == 2:
        return x - 1, y
    else:
        return x, y -1

def is_empty(direction, x, y):
    c = map[y][x]
    if c == '.': return True
    if direction in [0, 2]:
        if c == '-':return True
    else:
        if c == '|':return True
    return False

reflect = {'/': [3, 2, 1, 0],
           '\\' : [1, 0, 3, 2]}

todo = []

def beam(direction, x, y):
    global todo
    todo.append((direction, x, y))

def process(direction, x, y):
    if not (0 <= x < w and 0 <= y < h):
        return
    if n[y][x][direction]:
        return
    n[y][x][direction] = True

    if is_empty(direction, x, y):
        nx, ny = forward(direction, x, y)
        beam(direction, nx, ny)
    elif map[y][x] in ['-', '|']:
        nd = (direction + 1) % 4
        nx, ny = forward(nd, x, y)
        beam(nd, nx, ny)
        nd = (direction + 3) % 4
        nx, ny = forward( nd, x, y)
        beam(nd, nx, ny)
    else:
        nd = reflect[map[y][x]][direction]
        nx, ny = forward(nd, x, y)
        beam(nd, nx, ny)

def pe():
    total = 0
    for y in range(h):
        for x in range(w):
            if sum(n[y][x]) > 0:
                total += 1
    return total

with open('input16.txt') as f:
    map = [ [ s for s in l.rstrip() ] for l in f.readlines() ]
w = len(map[0])
h = len(map)

best = 0
n = []

def evaluate(d, x, y):
    global best, n
    n = [ [ [False, False, False, False] for _ in range(w) ] for _ in map ]
    beam (d, x, y)
    while (len(todo)):
        i = todo.pop()
        process(*i)
    score = pe()
    if score > best:
        best = score
        print(score)

# directions :
# 0 from left to right
# 1 from top to bottom
# 2 from right to left
# 3 from bottom to top
for x in range(w):
    evaluate(1, x, 0)
    evaluate(3, x, h-1)
for y in range(h):
    evaluate(0, 0, y)
    evaluate(2, w-1, y)

# 7616