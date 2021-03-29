---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.11.0
  kernelspec:
    display_name: Julia 1.6.0
    language: julia
    name: julia-1.6
---

# Calling simple fortran code

Compile simple_fortran.f with `gfortran -shared -fPIC -o simple_fortran.so simple_fortran.f`. This program implements a simple subroutine to swap the values of integers.

```julia
using Libdl
```

```julia
lib = Libdl.dlopen("./simple_fortran.so")
```

### Using ccall function

```julia
# passing variables and changing their value
a = Ref{Int32}(1999)
b = Ref{Int32}(2)
ccall(Libdl.dlsym(lib, :iswap_), Cvoid, (Ref{Int32}, Ref{Int32}), a, b)
b[] # a and b are swapped
```

### Using ccall macro

```julia
# passing variables and changing their value
a = Ref{Int32}(1999)
b = Ref{Int32}(2)
@ccall iswap_(a::Ref{Int32}, b::Ref{Int32})::Nothing
b[] # a and b are swapped
```

```julia

```
