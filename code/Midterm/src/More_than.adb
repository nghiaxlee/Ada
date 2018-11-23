function More_than(a: in Grid; MaxVal: Natural) return Boolean is
   res: Natural := 0;
begin
   for i in a'Range(1) loop
      for j in a'Range(2) loop
         res := res + a(i, j);
         if (res > MaxVal) then
            return true;
         end if;
      end loop;
   end loop;
   return false;
end More_than;
