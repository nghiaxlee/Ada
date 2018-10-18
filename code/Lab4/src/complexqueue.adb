package body ComplexQueue is

   procedure Push(Q: in out Queue; E: in Elem) is
   begin
      Q.Size := Q.Size + 1;
      Q.A(Q.Size) := E;
   end;
   procedure Pop(Q: in out Queue; E: out Elem) is
   begin
      E := Q.A(1);
      for I in 2..Q.Size loop
         Q.A(Integer'Pred(I)) := Q.A(I);
      end loop;
      Q.Size := Q.Size - 1;
   end;
   function IsEmpty(Q: Queue) return Boolean is
   begin
      return Size(Q) = 0;
   end;
   function IsFull(Q: Queue) return Boolean is
   begin
      return Size(Q) = Q.Size;
   end;
   function Size(Q: Queue) return Natural is
   begin
      return Q.Size;
   end;
end ComplexQueue;
