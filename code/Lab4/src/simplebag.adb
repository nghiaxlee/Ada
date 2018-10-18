with Ada.Integer_Text_IO;
with Ada.Text_IO;

package body SimpleBag is
   procedure InsertOne(B: in out Bag; E: in Elem) is
   begin
      B.A(E) := B.A(E) + 1;
      B.Size := B.Size + 1;
   end;
   procedure InsertMultiple(B: in out Bag; E: in Elem; N: in Natural) is
   begin
      B.A(E) := B.A(E) + N;
      B.Size := B.Size + N;
   end;
   procedure ExtractOne(B: in out Bag; E: in Elem) is
   begin
      B.A(E) := B.A(E) - 1;
      B.Size := B.Size - 1;
   end;
   procedure ExtractMultiple(B: in out Bag; E: in Elem; N: in Natural) is
   begin
      B.A(E) := B.A(E) - N;
      B.Size := B.Size - N;
   end;
   function IsEmpty(B: Bag) return Boolean is
   begin
      return B.Size = 0;
   end;
   procedure Print(B: Bag) is
   begin
      for I in 1..100 loop
         Ada.Integer_Text_IO.Put(I);
         Ada.Text_IO.Put(": ");
         Ada.Integer_Text_IO.Put(B.A(I));
         Ada.Text_IO.Put_Line("");
      end loop;
   end;
   -- ComplexBag
   procedure Insert(CB: in out ComplexBag; E: in ComplexElem) is
      found: Boolean := False;
   begin
      for I in 1..CB.Size loop
         if (CB.A(I).V = E.V) then
            CB.A(I).Num := CB.A(I).Num + E.Num;
            found := True;
         end if;
      end loop;
      if (not found) then

         CB.Size := CB.Size + 1;
         CB.A(CB.Size) := E;
      end if;
   end;
   procedure Print(CB: ComplexBag) is
   begin
      for I in 1..CB.Size loop
         Ada.Integer_Text_IO.Put(CB.A(I).V);
         Ada.Text_IO.Put(": ");
         Ada.Integer_Text_IO.Put(CB.A(I).Num);
         Ada.Text_IO.Put_Line("");
      end loop;
   end;

   function Init(V: Integer; Num: Natural) return ComplexElem is
   begin
      return (V, Num);
   end;

end SimpleBag;
