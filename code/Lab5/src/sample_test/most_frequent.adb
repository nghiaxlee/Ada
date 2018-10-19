--  function Most_frequent(a: Vector) return Elem is
--     res: Elem := a(a'First);
--     function Multiplicity(x: Elem) return Natural is
--        cnt: Natural := 0;
--     begin
--        for i in a'First..a'Last loop
--           if a(i) = x then
--              cnt := cnt + 1;
--           end if;
--        end loop;
--        return cnt;
--     end Multiplicity;
--  begin
--     for i in Index'Succ(a'First)..a'Last loop
--        if Multiplicity(a(i)) > Multiplicity(res) then
--           res := a(i);
--        end if;
--     end loop;
--     return res;
--  end Most_frequent;

function Most_frequent(a: Vector) return Elem is
   res: Elem := a(a'First);
   cnt: Natural := 0;
   type TArray is array(Index range <>) of Natural;
   Multiplicity: TArray(a'Range) := (others => 0);

   function Find_Previous(id: Index) return Natural is
      x: Elem := a(id);
   begin
      for i in reverse a'First..Index'Pred(id) loop
         if a(i) = x then
            return Multiplicity(i);
         end if;
      end loop;
      return 0;
   end Find_Previous;
begin
   for i in a'First..a'Last loop
      Multiplicity(i) := Find_Previous(i) + 1;
   end loop;

   for i in a'First..a'Last loop
      if cnt < Multiplicity(i) then
         res := a(i);
         cnt := Multiplicity(i);
      end if;
   end loop;

   return res;
end Most_frequent;
