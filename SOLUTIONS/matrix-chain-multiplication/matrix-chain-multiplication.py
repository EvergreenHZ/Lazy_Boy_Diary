scale = [30, 35, 15, 5, 10, 20, 25]

def matrix_chain_multiplication(i, j):
    if i == j:
        return 0
    else:
        result = 1000000000
        for k in range(i, j + 1):
            if k == j:
                return result
            else:
                result = min(result, \
                        matrix_chain_multiplication(i, k) + \
                        matrix_chain_multiplication(k + 1, j) + \
                        scale[i - 1] * scale[k] * scale[j])
        return result

print(matrix_chain_multiplication(1, 6))
