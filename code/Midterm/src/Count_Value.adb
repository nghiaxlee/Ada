function Count_Value(a: in Grid) return Natural is
   res : Natural := 0;
begin
   for i in a'Range(1) loop
      for j in a'Range(2) loop
         if Check(a(i,j)) then
            res := res + 1;
         end if;
      end loop;
   end loop;
   return res;
end Count_Value;
