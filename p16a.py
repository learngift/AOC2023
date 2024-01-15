
# directions :
# 0 from left to right
# 1 from top to bottom
# 2 from right to left
# 3 from bottom to top

from functools import total_ordering


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

def v(x, y):
    if map[y][x] != '.':
        return map[y][x]
    s = sum(n[y][x])
    if s > 1: return str(s)
    dr, db, dl, dt = n[y][x]
    if dr: return '>'
    if db: return 'V'
    if dl: return '<'
    if dt: return '^'
    return '.'

def p():
    for y in range(h):
        print(''.join([ v(x, y) for x in range(w) ]))
total = 0
def ve(x, y):
    if sum(n[y][x]) > 0:
        global total
        total = total + 1
        return '#'
    return '.'

def pe():
    for y in range(h):
        print(''.join([ ve(x, y) for x in range(w) ]))
    print (f'total={total}')

with open('input16.txt') as f:
    # map = [ [ s for s in l.rstrip() ] for l in f.readlines() ]
    map = []
    for l in f.readlines():
        map.append([ s for s in l.rstrip() ])
w = len(map[0])
h = len(map)

n = [ [ [False, False, False, False] for _ in range(w) ] for _ in map ]

p()
print()
beam (0, 0, 0)

while (len(todo)):
    i = todo.pop()
    process(*i)
    print(len(todo))

p()
print()
pe()

# 7185