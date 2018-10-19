function has_repetition(v: Vector) return Boolean is
   l: Index := v'First;
   r: Index := v'Last;
begin
   for i in v'First..Index'Pred(v'Last) loop
      if v(i) = v(Index'Succ(i)) then
         return True;
      end if;
   end loop;
   return False;
end has_repetition;
