package ComplexQueue is
   subtype Elem is Integer;

   type Queue(Max: Positive) is limited private;

   procedure Push(Q: in out Queue; E: in Elem);
   procedure Pop(Q: in out Queue; E: out Elem);
   function IsEmpty(Q: Queue) return Boolean;
   function IsFull(Q: Queue) return Boolean;
   function Size(Q: Queue) return Natural;

private
   type TArray is array(Integer range <>) of Elem;
   type Queue(Max: Positive) is record
      A: TArray(1..Max);
      Size: Natural := 0;
   end record;
end ComplexQueue;
