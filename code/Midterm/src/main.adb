with Count, More_than, Count_Value, Migrate;
with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is
   type t1 is array(Integer range <>, Integer range <>) of Natural;
   function MyCount is new Count(Integer, t1);
   function MyMT is new More_than(Integer, t1);

   function Greater3(x: Natural) return Boolean is
   begin
      return x > 3;
   end Greater3;
   function MyCountVal is new Count_Value(Integer, Natural, t1, Greater3);

   procedure MyMigrate is new Migrate(Integer, t1);

   a: t1(1..3, 1..3) := ((1,2,3),(4,5,6),(7,8,9));
   b: t1(1..10, 1..10) := ((1, 1, 1, 1, 0, 1, 1, 1, 1, 1),
                           (1, 1, 1, 1, 5, 1, 1, 1, 1, 1),
                           (1, 1, 1, 1, 0, 1, 1, 1, 1, 1),
                           (1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                           (1, 1, 1, 1, 0, 1, 1, 1, 1, 1),
                           (1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                           (1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                           (1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                           (1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                           (1, 1, 1, 1, 1, 1, 1, 1, 1, 1));
begin
   Put_Line(Natural'Image(MyCount(a)));
   Put_Line(Boolean'Image(MyMT(a, 40)));
   Put_Line(Boolean'Image(MyMT(a, 46)));
   Put_Line(Natural'Image(MyCountVal(a)));
   MyMigrate(b, 2);
   for i in b'Range(1) loop
      for j in b'Range(2) loop
         Put(Natural'Image(b(i, j)));
         Put(" ");
      end loop;
      New_Line;
   end loop;
end Main;
