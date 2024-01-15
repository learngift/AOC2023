
total = 0

def can_be(s, t):
    return s == '?' or s == t

def comb(conditions, sizes):
    if len(sizes) == 0:
        for c in conditions:
            if not can_be(c, '.'):
                return 0
        return 1
    # longueur minimale pour tout faire rentrer
    min_len = sum(sizes) + len(sizes)
    if min_len > len(conditions):
        print(f'comb({conditions}, {sizes}) -> min_len has failed ')
        return 0
    s, *tail = sizes
    nb_comb = 0
    for start in range(0, len(conditions) - min_len + 1):
        if start > 0 and not can_be(conditions[start - 1], '.'):
            break
        can_fit = can_be(conditions[start + s], '.')
        for i in range(start, start + s):
            if not can_be (conditions[i], '#'):
                can_fit = False
        if not can_fit:
            continue
        nb_comb += comb(conditions[start+s+1:], tail)
    print(f'comb({conditions}, {sizes} -> {nb_comb})')
    return nb_comb

with open('input12.txt') as f:
    for line in f:
        conditions, sizes = line.split(' ')
        sizes = [ int(s) for s in sizes.split(',') ]
        conditions = conditions + '.'
        count = comb(conditions, sizes)
        print(f'{line[:-1]} -> {count}')
        total += count
print(total)