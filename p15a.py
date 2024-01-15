
total = 0

def process (s):
    global total
    h = 0
    for c in s:
        h += ord(c)
        h *= 17
        h = h % 256
    print(f'Hash({s}) = {h}')
    total += h

with open('input15.txt') as f:
    for l in f.readlines():
        for s in l.rstrip().split(','):
            process (s)
print(total)
# 512797