with Ada.Text_IO;
with Ada.Integer_Text_IO;
with bags;
use Ada.Text_IO;
procedure Main is
   package MyBag is new Bags(Integer);

   procedure Put_Int(x: Integer) is
   begin
      Ada.Integer_Text_IO.Put(x);
      Ada.Text_IO.New_Line;
   end Put_Int;

   procedure Put_Bag is new MyBag.For_Each(Put_Int);

   B: MyBag.Bag(5);
begin
   --  Insert code here.
   MyBag.Add(B, 1);
   MyBag.Add(B, 1);
   MyBag.Add(B, 5);
   MyBag.Add(B, 4);
   MyBag.Add(B, 3);
   MyBag.Remove(B, 3);
   Ada.Integer_Text_IO.Put(MyBag.Multiplicity(B, 1));
   Ada.Integer_Text_IO.Put(MyBag.Multiplicity(B, 3));
   Ada.Integer_Text_IO.Put(MyBag.Multiplicity(B, 9));
   Ada.Text_IO.New_Line;
   Put_Bag(B);
end Main;
