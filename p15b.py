
box = box = [ [] for i in range(256) ]

def my_index(a_box, s):
    for i in range(len(a_box)):
        if a_box[i][0] == s:
            return i
    return -1

def process (s):
    if s[-1] == '-':
        focal = None
        s = s[:-1]
    else:
        assert s[-2] == '='
        focal = int(s[-1])
        s = s[:-2]

    h = 0
    for c in s:
        h += ord(c)
        h *= 17
        h = h % 256
    #print(f'Hash({s}) = {h}')

    the_box = box[h]
    i = my_index(the_box, s)
    if focal is None:
        if i != -1:
            del the_box[i]
    else:
        if i == -1:
            the_box.append( (s, focal) )
        else:
            the_box[i] = (s, focal)

def p():
    for i in range(256):
        if len(box[i]):
            content = [ f'[{e[0]} {e[1]}]' for e in box[i] ]
            print(f'Box {i}: {" ".join(content)}')

with open('input15.txt') as f:
    for l in f.readlines():
        for s in l.rstrip().split(','):
            process (s)
        p()
print(sum([ (bi + 1) * (si + 1) * box[bi][si][1] for bi in range(len(box)) for si in range(len(box[bi])) ]))
# 262454