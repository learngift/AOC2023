
total = 0

def nb_o(a):
    return len([ e for e in a if e == 'O'])

def north_load(a):
    return sum([nb_o(a[y]) * ( len(a) - y ) for y in range(0, len(a)) ])

def tilt_north(a):
    for y in range(0, len(a) - 1):
        for x in range(0, len(a[y])):
            if a[y][x] == '.':
                dy = y + 1
                while dy < len(a) and a[dy][x] == '.':
                    dy += 1
                if dy < len(a) and a[dy][x] == 'O':
                    a[y][x] = 'O'
                    a[dy][x] = '.'

def tilt_west(a):
    for x in range(0, len(a[0]) - 1):
        for y in range(0, len(a)):
            if a[y][x] == '.':
                dx = x + 1
                while dx < len(a[0]) and a[y][dx] == '.':
                    dx += 1
                if dx < len(a[0]) and a[y][dx] == 'O':
                    a[y][x] = 'O'
                    a[y][dx] = '.'

def tilt_south(a):
    a.reverse()
    tilt_north(a)
    a.reverse()

def tilt_east(a):
    for x in a:
        x.reverse()
    tilt_west(a)
    for x in a:
        x.reverse()

def p(a):
    for l in a:
        print(''.join(l))
    print()

def cycle():
    tilt_north(a) 
    tilt_west(a) 
    tilt_south(a) 
    tilt_east(a)

def billion_cycle():
    h = dict()
    nb = 0
    while True:
        cycle()
        nb += 1
        p = '-'.join([ ''.join(l) for l in a ])
        v = h.get(p)
        if v is None:
            h[p] = nb
        else:
            to_do = (1000000000-nb) % (nb - v)
            for i in range(to_do): cycle()
            return


with open('input14.txt') as f:
    a = []
    for l in f.readlines():
        a.append([ c for c in l.rstrip() ])
print(f'a={a} ')
#cycle()
#cycle()
#cycle()
billion_cycle()
p(a)
print(north_load(a))
# 104533