generic
   type Index is (<>);
   type Grid is array(Index range <>, Index range <>) of Natural;
procedure Migrate(a: in out Grid; MaxVal: Natural);
