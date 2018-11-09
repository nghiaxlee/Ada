generic
   type Elem is (<>);
package PSet is
   type Set is private;
   type TArray is array(Positive range <>) of Elem;

   function Make_Set (L: TArray) return Set;
   function Make_Set (E: Elem) return Set;
   function Decompose (S: Set) return TArray;

   function "+" (S, T: Set) return Set; -- union
   function "*" (S, T: Set) return Set; -- intersection
   function "<" (E: Elem; S: Set) return Boolean; -- inclusion
   function Contains (S, T: Set) return Boolean; -- Check if S is subset of T
   function Size (S: Set) return Natural; -- the size of a set
   procedure print_Set (S: in Set); -- print the set

private
   type Set is array(Elem) of Boolean;
End PSet;
