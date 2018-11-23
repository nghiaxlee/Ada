generic
   type Index is (<>);
   type Elem is private;
   type Grid is array(Index range <>, Index range <>) of Elem;
   with function Check(x: Elem) return Boolean;
function Count_Value(a: in Grid) return Natural;
