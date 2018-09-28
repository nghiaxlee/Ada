with Ada.Integer_Text_IO, Ada.Text_IO, Ada.Float_Text_IO; 
use Ada.Integer_Text_IO;
with Math; -- use Mat;
procedure main is
   A, B : Positive;
   procedure perfect_numbers(A, B: Integer) is
   begin
      for i in A..B loop
         if Math.is_perfect(i) then
            Put(i);
            Ada.Text_IO.New_Line; 
         end if;
      end loop;
   end perfect_numbers;
begin
   Get( A );
   Get( B );
--     Put( Math.gcd(A,B) );
--     Ada.Text_IO.New_Line; 
--     Put( Math.factorial(A) );
--     Put(Math.digit_sum(A));
--     if Math.is_9_divisor(A) then Ada.Text_IO.Put_Line("Ok"); else Ada.Text_IO.Put_Line("No"); end if;
   perfect_numbers(1, 10000);
   Ada.Float_Text_IO.Put(Math.sin(3.14159 / 2.0));
--     if Math.is_palin(A) then Ada.Text_IO.Put_Line("Palin"); else Ada.Text_IO.Put_Line("Nem Palin"); end if;
--     Put(Math.recur_power(A, B));
--     Ada.Text_IO.New_Line;
--     Put(Math.recur_fact(11));
end main;

