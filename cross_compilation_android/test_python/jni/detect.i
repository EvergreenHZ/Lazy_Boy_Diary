%module detect
%include "typemaps.i"

%{
#include"npddetect.h"
#include"npdmodel.h"
#include "common.hpp"
%}

%include "std_vector.i"
        namespace std{
        %template(vectori) vector<int>;
        %template(vectorf) vector<float>;
}
%include"npddetect.h"
