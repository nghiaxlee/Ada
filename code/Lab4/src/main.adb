with SimpleBag, ComplexQueue, Ada.Command_Line, Ada.Integer_Text_IO;
--  use ComplexQueue;
use SimpleBag;
procedure Main is
--     Q: Queue(Ada.Command_Line.Argument_Count);
   B: Bag;
   CB: ComplexBag;
begin
   --  Insert code here.
--     for I in 1..Ada.Command_Line.Argument_Count loop
--        N := Integer'Value(Ada.Command_Line.Argument(I));
--        Push(Q, N);
--     end loop;
--     while not IsEmpty(Q) loop
--        Pop(Q, N);
--        Ada.Integer_Text_IO.Put(N);
--     end loop;
   InsertOne(B, 12);
   InsertMultiple(B, 100, 123);
   ExtractMultiple(B, 100, 100);
   Print(B);
   Insert(CB, Init(3, 10));
   Insert(CB, Init(1, 10));
   Insert(CB, Init(3, 10));
   Print(CB);
end Main;
