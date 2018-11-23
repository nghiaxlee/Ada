function Count(a: in Grid) return Natural is
   res: Natural := 0;
begin
   for i in a'Range(1) loop
      for j in a'Range(2) loop
         res := res + a(i, j);
      end loop;
   end loop;
   return res;
end Count;
