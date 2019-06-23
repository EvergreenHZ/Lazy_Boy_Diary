
'''
Greedy algo applyed to Activity Selector
See the power of inner function definition
'''

s = [0, 1, 3, 0, 5, 3, 5, 6, 8, 8, 2, 12]
f = [0, 4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16]

def recursive_activity_selector(s, f, k, n, result):
    m = k + 1

    while m <= n and s[m] < f[k]:
        m = m + 1

    if m <= n:
        result.append(m)
        return recursive_activity_selector(s, f, m, n, result)
    else:
        return result

#result = []
#print(recursive_activity_selector(s, f, 0, 11, result))
#print(result)

def recursive_activity_selector_v2(s, f, n):
    result = []

    def inner_recursive(k):
        m = k + 1

        while m <= n and s[m] < f[k]:
            m = m + 1

        if m <= n:
            result.append(m)
            return inner_recursive(m)
        else:
            return result

    inner_recursive(0)

    return result

print(recursive_activity_selector_v2(s, f, 11))

