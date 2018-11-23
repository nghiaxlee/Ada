procedure Migrate(a: in out Grid; MaxVal: Natural) is
   procedure MoveUp(i, j: Index; a: in out Grid; MaxVal: Natural) is
      cap: Natural := 0;
   begin
      if (i = a'First(1)) then
         return;
      end if;
      if (a(Index'Pred(i), j) < MaxVal) then
         cap := MaxVal - a(Index'Pred(i), j);
      end if;
      if (a(i, j) - MaxVal < cap) then
         cap := a(i, j) - MaxVal;
      end if;
      a(i, j) := a(i, j) - cap;
      a(Index'Pred(i), j) := a(Index'Pred(i), j) + cap;
   end MoveUp;

   procedure MoveLeft(i, j: Index; a: in out Grid; MaxVal: Natural) is
      cap: Natural := 0;
   begin
      if (j = a'First(2)) then
         return;
      end if;
      if (a(i, Index'Pred(j)) < MaxVal) then
         cap := MaxVal - a(i, Index'Pred(j));
      end if;
      if (a(i, j) - MaxVal < cap) then
         cap := a(i, j) - MaxVal;
      end if;
      a(i, j) := a(i, j) - cap;
      a(i, Index'Pred(j)) := a(i, Index'Pred(j)) + cap;
   end MoveLeft;

   procedure MoveRight(i, j: Index; a: in out Grid; MaxVal: Natural) is
      cap: Natural := 0;
   begin
      if (j = a'Last(2)) then
         return;
      end if;
      if (a(i, Index'Succ(j)) < MaxVal) then
         cap := MaxVal - a(i, Index'Succ(j));
      end if;
      if (a(i, j) - MaxVal < cap) then
         cap := a(i, j) - MaxVal;
      end if;
      a(i, j) := a(i, j) - cap;
      a(i, Index'Succ(j)) := a(i, Index'Succ(j)) + cap;
   end MoveRight;

   procedure MoveDown(i, j: Index; a: in out Grid; MaxVal: Natural) is
      cap: Natural := 0;
   begin
      if (i = a'Last(1)) then
         return;
      end if;
      if (a(Index'Succ(i), j) < MaxVal) then
         cap := MaxVal - a(Index'Succ(i), j);
      end if;
      if (a(i, j) - MaxVal < cap) then
         cap := a(i, j) - MaxVal;
      end if;
      a(i, j) := a(i, j) - cap;
      a(Index'Succ(i), j) := a(Index'Succ(i), j) + cap;
   end MoveDown;
begin
   for i in a'Range(1) loop
      for j in a'Range(2) loop
         if (a(i, j) > MaxVal) then
            MoveUp(i, j, a, MaxVal);
            MoveLeft(i, j, a, MaxVal);
            MoveRight(i, j, a, MaxVal);
            MoveDown(i, j, a, MaxVal);
            if (a(i, j) > MaxVal) then
               a(i, j) := MaxVal;
            end if;
         end if;
      end loop;
   end loop;
end Migrate;
