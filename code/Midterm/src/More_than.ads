generic
   type Index is (<>);
   type Grid is array(Index range <>, Index range <>) of Natural;
function More_than(a: in Grid; MaxVal: Natural) return Boolean;
