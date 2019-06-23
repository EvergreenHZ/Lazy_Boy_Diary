%module detect
%include "typemaps.i"
%include "arrays_java.i"
%include "various.i"

%{
#include"npddetect.h"
#include"npdmodel.h"
%}

%include "std_vector.i"
        namespace std{
        %template(vectori) vector<int>;
        %template(vectorf) vector<float>;
}
%include"npddetect.h"
