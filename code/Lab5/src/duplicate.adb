procedure Duplicate(a: TArray; b: out Boolean; i, j: out Index) is
   l1: Index := a'First;
   l2: Index;
   r: Index := a'Last;
begin
   b := False;
   while l1 < r loop
      l2 := Index'Succ(l1);
      while l2 <= r loop
         if a(l1) = a(l2) and a(l2) = a(l1) then
            b := True;
            i := l1;
            j := l2;
         end if;
         l2 := Index'Succ(l2);
      end loop;
      l1 := Index'Succ(l1);
   end loop;
end Duplicate;
