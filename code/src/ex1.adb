--  with Ada.Integer_Text_IO;
--  use Ada.Integer_Text_IO;

--  procedure Ex1 is
--     n, s: Positive;
--  begin
--     Get(n);
--     s := (n * (n + 1)) / 2;
--     Put(s);
--  end Ex1;


--  procedure Ex1 is
--     a, b, c:Integer;
--     function MaxNum(a:Integer; b:Integer) return Integer is
--     begin
--        return (if a > b then a else b);
--     end MaxNum;
--  begin
--     Get(a);
--     Get(b);
--     Get(c);
--     Put(MaxNum(c, MaxNum(a, b)));
--  end Ex1;


--  procedure Ex1 is
--     x: Integer;
--     function CheckSign(x: Integer) return Integer is
--     begin
--  --        if x = 0 then
--  --           return 0;
--  --        else
--  --           return x / abs x;
--  --        end if;
--        
--        if x > 0 then
--           return 1;
--        elsif x = 0 then
--           return 0;
--        else 
--           return -1;
--        end if;
--     end CheckSign;
--  begin
--     Get(x);
--     Put(CheckSign(x));
--  end Ex1;


--  procedure Ex1 is
--     c, n, k: Positive;
--  begin
--     c := 1;
--     Get(n);
--     Get(k);
--     for i in 1..k loop
--        c := (c * (n - i + 1)) / i;
--     end loop;
--     Put(c);
--  end Ex1;


with Ada.Float_Text_IO;
use Ada.Float_Text_IO;


--  procedure Ex1 is
--     pi, i2: Float;
--  begin
--     pi := 1.0;
--     for i in 1..100000 loop
--        i2 := Float(i) * 2.0;
--        pi := pi * (i2 / (i2 - 1.0)) * (i2 / (i2 + 1.0));
--     end loop;
--     Put(pi * 2.0);
--  end Ex1;

procedure Ex1 is
   e, curr: Float;
begin
   e := 1.0;
   curr := 1.0;
   for i in 1..100000 loop
      curr := curr / Float(i);
      e := e + curr;
   end loop;
   Put(e);
end Ex1;


--  procedure Ex1 is
--  begin
--  end Ex1;
