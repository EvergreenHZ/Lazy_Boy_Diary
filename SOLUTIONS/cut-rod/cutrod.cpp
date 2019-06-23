#include <iostream>
#include <vector>
#include <string>
#include <cstdlib>

using namespace std;

#define INF -10000
#define MAX(a, b) \
        ((a) > (b) ? (a) : (b))

int p[10] = {0, 1, 5, 8, 9, 10, 17, 17, 20, 24};

int cutRodRecursive(int n)
{
        if (n == 0) {
                return 0;
        }

        int q = INF;
        for (int i = 1; i <= n; i++) {
                q = MAX(q, p[i] + cutRodRecursive(n - i));
        }
        return q;
}

int cutRodMemo(vector<int> &rn, int n)
{
        if (n == 0) {
                return 0;
        }
        if (rn[n] >= 0) {
                return rn[n];
        }

        int q = INF;
        for (int i = 1; i <= n; i++) {
                q = MAX(q, cutRodMemo(rn, (n - i)) + p[i]);
        }
        rn[n] = q;
        return q;
}


int main(int argc, char* argv[])
{
        int inches = atoi(argv[1]);
        //int solu = cutRodRecursive(inches);
        vector<int> rn(inches + 1, INF);
        rn[0] = 0;
        int solu = cutRodMemo(rn, inches);

        cout << "Optimal value is: " << solu << endl;

        return 0;
}
