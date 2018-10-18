package SimpleBag is
   subtype Elem is Natural;

   type ComplexElem is private;
   type Bag is limited private;
   type ComplexBag is limited private;

   procedure InsertOne(B: in out Bag; E: in Elem);
   procedure InsertMultiple(B: in out Bag; E: in Elem; N: in Natural);
   procedure ExtractOne(B: in out Bag; E: in Elem);
   procedure ExtractMultiple(B: in out Bag; E: in Elem; N : in Natural);
   function IsEmpty(B: Bag) return Boolean;
   procedure Print(B: Bag);
   procedure Insert(CB: in out ComplexBag; E: in ComplexElem);
   procedure Print(CB: ComplexBag);

   function Init(V: Integer; Num: Natural) return ComplexElem;

private
   type ComplexElem is record
      V: Integer;
      Num: Natural :=  0;
   end record;
   type TArray is array(Integer range <>) of Elem;
   type CArray is array(Integer range <>) of ComplexElem;
   type Bag is record
      A: TArray(1..100) := (others => 0);
      Size: Natural := 0;
   end record;
   type ComplexBag is record
      A: CArray(1..100) := (others => (0, 0));
      Size: Natural := 0;
   end record;
end SimpleBag;
