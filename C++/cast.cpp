#include <iostream>
using namespace std;

int main()
{
        int a = 10;
        int b = 20;

        double d = static_cast<double>(a) / b;
        
        cout << b << endl;


        const int e = 10;
        // int *f = static_cast<int*>(&e);  // wrong
        int *f = const_cast<int*>(&a);

        return 0;
}
