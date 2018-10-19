generic
   type Elem is private;
   type Index is (<>);
   type Vector is array (Index range <>) of Elem;
function Most_frequent(a: Vector) return Elem;
