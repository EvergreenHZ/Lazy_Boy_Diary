X = "ABCBDAB"
Y = "BDCABA"

def lcs(i, j):
    if i == 0 or j == 0:
        return 0

    if X[i - 1] == Y[j - 1] :
        return 1 + lcs(i - 1, j - 1)

    return max(lcs(i - 1, j), lcs(i, j - 1))

print(lcs(len(X), len(Y)))
