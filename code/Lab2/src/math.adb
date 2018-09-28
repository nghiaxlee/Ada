package body Math is

   function gcd ( A, B : Positive ) return Positive is
      X: Positive := A;
      Y: Positive := B;
   begin
      while X /= Y loop
         if X > Y then
            X := X - Y;
         else
            Y := Y - X;
         end if;
      end loop;
      return X;
   end gcd;

   function factorial( N: Natural ) return Positive is
      Fakt : Positive := 1;
   begin
      for I in 1..N loop
         Fakt := Fakt * I;
      end loop;
      return Fakt;
   end factorial;
   
   function digit_sum(N: Positive) return Positive is
      tmp: Natural := N;
      sum: Natural := 0;
   begin
      while tmp > 0 loop
         sum := sum + tmp mod 10;
         tmp := tmp / 10;
      end loop;
      return sum;
   end digit_sum;
   
   function is_9_divisor(N: Positive) return Boolean is
   begin
      return digit_sum(N) mod 9 = 0;
   end is_9_divisor;
   
   function is_perfect(N: Positive) return Boolean is
      sum: Positive := 1;
      i: Positive := 2;
   begin
      while i * i <= N loop
         if N mod i = 0 then
            sum := sum + i;
            if N / i > i then
               sum := sum + N / i;
            end if;
         end if;
         i := i + 1;
      end loop;
      return sum = N;
   end is_perfect;
   
   function sin(x: Float) return Float is
      ret: Float := x;
      curr: Float := x;
      sign: Float := -1.0;
   begin
      for i in 1..1000000 loop
         curr := curr / Float(2 * i);
         curr := curr / Float(2 * i + 1);
         curr := curr * x;
         curr := curr * x;
         ret := ret + sign * curr;
         sign := -sign;
      end loop;
      return ret;
   end sin;
   
   function is_palin(N: Positive) return Boolean is
      function rev_int(N: Positive) return Positive is
         tmp: Natural := N;
         rev: Natural := 0;
      begin
         while tmp > 0 loop
            rev := rev * 10 + tmp mod 10;
            tmp := tmp / 10;
         end loop;
         return rev;
      end rev_int;
   begin
      return N = rev_int(N);
   end is_palin;
   
   function recur_power(X, N: Positive) return Positive is
      tmp: Positive;
   begin
      if N = 1 then
         return X;
      else
         tmp := recur_power(X, N / 2);
         if N mod 2 = 0 then
            return tmp * tmp;
         else
            return tmp * tmp * X;
         end if;
      end if;
   end recur_power;
   
   function recur_fact(N: Positive) return Positive is
   begin
      if N = 1 then
         return 1;
      else 
         return N * recur_fact(N - 1);
      end if;
   end recur_fact;

end Math;
   
