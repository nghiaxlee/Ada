procedure Reversal(a: in out TArray) is
   i: Index := a'First;
   j: Index := a'Last;
begin
   while i < j loop
      swap(a(i), a(j));
      i := Index'Succ(i);
      j := Index'Pred(j);
   end loop;
end Reversal;
