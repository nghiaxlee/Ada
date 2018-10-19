generic
   type Elem is private;
   type Index is (<>);
   type Vector is array (Index range <>) of Elem;
function has_repetition(v: Vector) return Boolean;
