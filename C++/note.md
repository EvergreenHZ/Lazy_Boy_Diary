Basic Knowledge
===============

# OO in C++
- *encapsulation*
- *inheritance*
- *polymorphism*

# Dangling, Wild Pointers
```C
// not initialized pointer: wild pointer
int* p;  // wild pointer

// pointer points to freed memory: dangling pointer
int *p = new int(100);
free(p);
p;  // dangling pointer

int* foo() {
        int x = 10;
        int* p = &x;
        return p;  // dangling pointer, x is deconstructed
}
```

# smart pointer: say shared_ptr, weak_ptr, auto_ptr, unique_ptr
e.g. shared_ptr
- auto deconstructed (deconstruct will be called when you leave the scope)
- reference counter (static int counter)
- however, circular reference

# explicit keyword
- avoid implicit conversion

# deleted function
```C++
class Foo {
public:
        Foo() = delete;
        explicit Foo(int i) { x = i;}
        Foo(const Foo&) = delete;
        Foo& operator=(const Foo&) = delete;
public:
        int x;
};
int main() {
        Foo f;  // illegal, can't call default constructor
        Foo f(1); // ok;
        Foo bar = f;  // illegal
}
```

# defaulted function
```C++
// constructor, deconstructor, copy constructor and =
class Foo {
public:
        int x, y, z;
public:
        Foo() = default;
        Foo(int, int, int);
};
```
- you can still use 0-paras constructor even you have the Foo(int, int, int).
- It's faster than you write own, and you can write less code.

# copy constructor and assignment operator
- copy constructor is called when a new object is created from an existing object
- assignment op is called when an already initialized obj reassigned from another one

# four kinds of cast
- const_cast<T> : const to non-const, but you still can't modify it.
- dynamic_cast<T> : polymophic cast, verify validity
- static_cast<T> : non-polymorphic cast, say base class pointer to derived class one
- reinterpret_cate<T> : pointer to another kind of type, say pointer -> int

# initialize and assign
- for basic data types, they may almost same
- for class types, initializing calls constructor/copy constructor, but assignment calls operator=.

# definition and declaration
- *definition* : declare the variable and allocate memory.
- *declaration*: tell compiler there exists such a variable.

# order of construction and destruction
```C++
class A {};

class B{};

class C: public A, public B {};

int main() {
        C c;
}
A(), B(), C(), ~C(), ~B(), ~A()
```
```C++
class A {};
class B {};
class C:public A, public B {
public: 
        B b;
        A a;
        C():a(A()), b(B()) {}
};

int main() {
        C c;
}
A(), B(), B(), A(), C(), ~C(), ~A(), ~B(), ~B(), ~A()
```

# initializing list
- object is initialized in initializing list, and assigned in the body of constructor
- *non-static const data member*, *reference* and *member objects without default constructor*
- const static must be initialized at definition

# abstract class contains at least one pure virtual function
```C++
class AbstractClass {
public:
        virtual void f() = 0;
};
```
+ AbstractClass can't be instantiated, it's just a interface and should be inherited

# overload, override, hide
