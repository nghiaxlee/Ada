package body Bags is
   procedure Add(B: in out Bag; x: Elem) is
      found: Boolean := False;
   begin
      for i in 1..B.Size loop
         if x = B.Data(i).V then
            B.Data(i).N := B.Data(i).N + 1;
            found := True;
         end if;
      end loop;
      if not found then
         B.Size := B.Size + 1;
         B.Data(B.Size).V := x;
         B.Data(B.Size).N := 1;
      end if;
   end Add;

   procedure Remove(B: in out Bag; x: Elem) is
   begin
      for i in 1..B.Size loop
         if x = B.Data(i).V then
            B.Data(i).N := B.Data(i).N - 1;
         end if;
      end loop;
   end Remove;

   function Multiplicity(B: in Bag; x: Elem) return Natural is
   begin
      for i in 1..B.Size loop
         if x = B.Data(i).V then
            return B.Data(i).N;
         end if;
      end loop;
      return 0;
   end Multiplicity;

   procedure For_Each(B: in Bag) is
   begin
      for i in 1..B.Size loop
         if B.Data(i).N > 0 then
            Process_Element(B.Data(i).V);
         end if;
      end loop;
   end For_Each;
end Bags;
