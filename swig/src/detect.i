%module detect
%{
#include"npddetect.h"
#include"npdmodel.h"
%}
%include "std_vector.i"
namespace std{
        %template(vectori) vector<int>;
        %template(vectorf) vector<float>;
        %template(vectoru) vector<unsigned char>;
}
%include"npddetect.h"

