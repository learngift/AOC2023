
total = 0

def nb_o(a):
    return len([ e for e in a if e == 'O'])

def process(a):
    print(f'a={a} ')
    for y in range(0, len(a) - 1):
        for x in range(0, len(a[y])):
            if a[y][x] == '.':
                dy = y + 1
                while dy < len(a) and a[dy][x] == '.':
                    dy += 1
                if dy < len(a) and a[dy][x] == 'O':
                    a[y][x] = 'O'
                    a[dy][x] = '.'

    print(f'\n a={a} ')


    global total

    for y in range(0, len(a)):
        total += nb_o(a[y]) * ( len(a) - y )


with open('input14.txt') as f:
    a = []
    for l in f.readlines():
        l = l.rstrip()
        a.append([ c for c in l ])
process(a) 
print(total)
# 108813