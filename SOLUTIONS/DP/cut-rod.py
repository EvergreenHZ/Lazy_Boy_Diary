price = [0, 1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
MINUS_INFINITY = -10000000;

def cut_rod_naive_recursion(p, n):
    if n == 0:
        return 0

    q = MINUS_INFINITY
    for i in range(1, n + 1):
        q = max(q, p[i] + cut_rod_naive_recursion(p, n - i))

    return q

#print(cut_rod_naive_recursion(price, 7))
#print(cut_rod_naive_recursion(price, 8))

def cut_rod_memoized_recursion(p, n, table, optimal_position):
    if n == 0:
        return 0

    if table[n] > MINUS_INFINITY:
        return table[n]

    q = MINUS_INFINITY
    for i in range(1, n + 1):
        #q = max(q, p[i] + cut_rod_memoized_recursion(p, n - i, table, optimal_position))
        sub = p[i] + cut_rod_memoized_recursion(p, n - i, table, optimal_position);
        if q < sub:
            q = sub
            optimal_position[n] = i
    table[n] = q
    return q

def test_top_down_dp(n):
    table = []
    table.append(0)
    optimal_position = []
    optimal_position.append(-1)
    for i in range(1, n + 1):
        optimal_position.append(-1)
        table.append(MINUS_INFINITY)

    optimal = cut_rod_memoized_recursion(price, n, table, optimal_position)
    print(optimal_position)

    while n > 0:
        print(optimal_position[n])
        n = n - price[optimal_position[n]]
    return optimal
    #return cut_rod_memoized_recursion(price, n, table, optimal_position)

#print(test_top_down_dp(10))


def cut_rod_bottom_up(p, n):
    if n == 0:
        return 0

    optimal_position = []
    table = []
    for x in range(0, n + 1):
        optimal_position.append(-1)
        table.append(MINUS_INFINITY)
    table[0] = 0

    for j in range(1, n + 1):  # for all subproblem

        q = MINUS_INFINITY

        for i in range(1, j + 1):
            sub = p[i] + table[j - i]
            if q < sub:
                q = sub
                optimal_position[j] = i
        table[j] = q
    print(optimal_position)
    print(table[n])

cut_rod_bottom_up(price, 8)
