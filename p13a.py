
total = 0

def find_mirror(a):
    for i in range(0, len(a) -1):
        same = True
        for j in range(i+1, 1+min (len(a)-1, 1 + 2*i)):
            m = 2 * i - j + 1
            if a[j] != a[m]:
                same = False
        if same:
            return i+1
    return -1 


def process(a):
    na = find_mirror(a)
    print(f'a={a} , na={na}')
    b = []
    for i in range(0, len(a[0])):
        c = [ s[i] for s in a ]
        b.append(''.join(c))    
    nb = find_mirror(b)
    print(f'b={b} , nb={nb}')

    global total
    if na != -1:
        total += na * 100
    if nb != -1:
        total += nb 

with open('input13.txt') as f:
    a = []
    for l in f.readlines():
        l.rstrip()
        if len(l) <= 1:
            process(a)
            a = []
        else:
            a.append(l[:-1])
process(a) 
print(total)
#33975