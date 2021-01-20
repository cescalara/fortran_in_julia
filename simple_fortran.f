      program simple_fortran
      implicit double precision (a-h,o-z)
      
      external iswap

      integer a, b
      a = 1
      b = 2

      call iswap(a, b)

      print*, a
      print*, b
      
      end
      
c     Very simple subroutine
      subroutine iswap (a, b)
      integer a, b
c     Local variables
      integer tmp

      tmp = a
      a = b
      b = tmp

      return
      end

c     Subroutine with function arg
      subroutine usefunc (y, func)
      implicit double precision (a-h,o-z)
      
      x = 20.0

      y = func(x)
      
      return
      end
