generic
   type Elem is private;
   type Index is (<>);
   type TArray is array (Index range <>) of Elem;
   with procedure Swap(x, y: in out Elem);
procedure Reversal(a: in out TArray);
