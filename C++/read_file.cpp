#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char* argv[])
{
        string file_path(argv[1]);
        string line;
        ifstream inf(file_path.c_str());
        while (getline(inf, line)) {
                // do something here
        }

        return 0;
}
