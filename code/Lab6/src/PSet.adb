with Ada.Text_IO;

package body PSet is
   function Make_Set (L: TArray) return Set is
      S: Set := (others => False);
   begin
      for i in L'Range loop
         S(L(i)) := True;
      end loop;
      return S;
   end;

   function Make_Set (E: Elem) return Set is
      S: Set := (others => False);
   begin
      S(E) := True;
      return S;
   end;

   function Decompose (S: Set) return TArray is
      A: TArray(1..Size(S));
      n: Positive := 1;
   begin
      for i in S'Range loop
         if S(i) then
            A(n) := i;
            n := n + 1;
         end if;
      end loop;
      return A;
   end;

   function "+" (S, T: Set) return Set -- union
   is
      res: Set := (others => False);
   begin
      for i in S'Range loop
         if S(i) then
            res(i) := True;
         end if;
      end loop;
      for i in T'Range loop
         if T(i) then
            res(i) := True;
         end if;
      end loop;
      return res;
   end;

   function "*" (S, T: Set) return Set -- intersection
   is
      res: Set := (others => False);
   begin
      for i in S'Range loop
         if S(i) and T(i) then
            res(i) := True;
         end if;
      end loop;
      return res;
   end;

   function "<" (E: Elem; S: Set) return Boolean -- inclusion
   is
   begin
      return S(E);
   end;

   function Contains (S, T: Set) return Boolean -- Check if S is subset of T
   is
   begin
      for i in S'Range loop
         if S(i) then
            if not T(i) then
               return False;
            end if;
         end if;
      end loop;
      return True;
   end;

   function Size (S: Set) return Natural -- the size of a set
   is
      n: Natural := 0;
   begin
      for i in S'Range loop
         if S(i) then
            n := n + 1;
         end if;
      end loop;
      return n;
   end;

   procedure print_Set (S: in Set) -- print the set
   is
   begin
      for i in S'Range loop
         if S(i) = True then
            Ada.Text_IO.Put_Line(Elem'Image(i));
         end if;
      end loop;
   end;
end PSet;
