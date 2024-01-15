
total = 0

def can_be(s, t):
    return s == '?' or s == t

def split_size(a):
    i = a.index(max(a))
    while i < len(a) // 2 and a[i+1] == a[i]:
        i += 1
    return a[:i], a[i], a[i+1:]

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
    
    lhs, s, rhs = split_size(sizes)
    min_len_left = sum(lhs) + len(lhs)
    nb_comb = 0
    for start in range(min_len_left, min_len_left+len(conditions) - min_len + 1):
        # print (f'start = {start}')
        if start > 0 and not can_be(conditions[start - 1], '.'):
            continue
        can_fit = can_be(conditions[start + s], '.')
        for i in range(start, start + s):
            if not can_be (conditions[i], '#'):
                can_fit = False
        if not can_fit:
            continue
        left_comb = comb(conditions[0:start], lhs)
        if left_comb > 0:
            # print (f'left_comb = {left_comb}')
            nb_comb += left_comb * comb(conditions[start+s+1:], rhs)
            # print (f'left_comb = {left_comb}, nb_comb = {nb_comb}')
    # print(f'comb({conditions}, {sizes} -> {nb_comb})')
    return nb_comb

with open('input12.txt') as f:
    for line in f:
        # continue
        conditions, sizes = line.split(' ')
        sizes = [ int(s) for s in sizes.split(',') ]
        conditions = conditions + '?' + conditions + '?' + conditions + '?' + conditions + '?' + conditions + '.'
        count = comb(conditions, sizes + sizes + sizes + sizes + sizes)
        print(f'{line[:-1]} -> {count}')
        total += count
print(total)

# pourquoi ??????????.? 2,2 est lent ?