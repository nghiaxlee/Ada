with reversal, duplicate;
with Ada.Text_IO;
use Ada.Text_IO;
procedure Main is
   type t is array(Integer range <>) of Integer;
   a: t(1..5):=(1, 2, 3, 4, 2);
   i, j: Integer;
   b: Boolean;

   procedure swap(a, b: in out Integer) is
      tmp: Integer := a;
   begin
      a := b;
      b := tmp;
   end swap;

   procedure Int_Reversal is new Reversal(Integer, Integer, t, swap);
   procedure Int_Dup is new Duplicate(Integer, Integer, t, "=");
begin
   --  Insert code here.
--     Int_Reversal(a);
--     for i in a'Range loop
--        Put_Line(Integer'Image(a(i)));
--     end loop;
   Int_Dup(a, b, i, j);
   if b then
      Put_Line(Integer'Image(i) & Integer'Image(j));
   else
      Put_Line("No!!");
   end if;
end Main;
