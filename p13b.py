
total = 0

def compare(s, t):
    if s == t : return 0
    nb = 0
    for i in range(len(s)):
        if s[i] != t[i]:
            nb += 1
    return nb

def find_mirror(a):
    for i in range(0, len(a) -1):
        same = 0
        for j in range(i+1, 1+min (len(a)-1, 1 + 2*i)):
            m = 2 * i - j + 1
            same += compare(a[j], a[m])
        if same == 1:
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
#