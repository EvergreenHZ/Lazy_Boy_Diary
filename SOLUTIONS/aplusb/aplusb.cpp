#include "../common.h"

// ^: addition without carrying
int aplusb(int a, int b)
{
        if (! (a & b)) {
                return a ^ b;
        } else {
                return aplusb(a ^ b, (a & b) << 1);
        }
}

int main()
{
        cout << aplusb(34, 48) << endl;
        cout << aplusb(174, 26) << endl;

        return 0;
}
