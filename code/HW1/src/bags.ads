generic
   type Elem is private;
package Bags is

   type Bag(Max: Positive) is limited private;

   procedure Add(B: in out Bag; x: Elem);
   procedure Remove(B: in out Bag; x: Elem);
   function Multiplicity(B: in Bag; x: Elem) return Natural;
   generic
      with procedure Process_Element(x: Elem);
   procedure For_Each(B: in Bag);

private
   type PairElem is record
      V: Elem;
      N: Natural;
   end record;
   type TArray is array(Positive range <>) of PairElem;
   type Bag(Max: Positive) is record
      Data: TArray(1..Max);
      Size: Natural := 0;
   end record;
end Bags;
