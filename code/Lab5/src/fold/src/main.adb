with Ada.Text_IO;
use Ada.Text_IO;
with Matrix_pack;
use Matrix_pack;

procedure Main is

   type TArray is array (Index range <>) of Elem;
   type Coord is array (Index range <>) of Index;

   T: TArray := (5, 3, 2, 4);
   M: Matrix := ((1, 2, 3),(4, 5, 6),(7, 8, 9));
   M1: Matrix := ((11, 22, 33, 44, 55, 0),(1, 8, 3, 8, 8, 0),(10, 10, 20, 30, 1, 0), (10, 10, 10, 10, 10, 10));
   visited: Matrix(M1'Range(1), M1'Range(2)) := (others => (others => 0));
   XI: Coord := (0, 1, 0, -1);
   YI: Coord := (1, 0, -1, 0);
   cnt: Index := 0;
   size: Index := M1'Length(1) * M1'Length(2);
   XX: Index := M1'First(1);
   YY: Index := M1'First(2);
   DX: Index := XI'First;
   DY: Index := YI'First;

   procedure Swap ( A, B: in out Elem ) is
      Tmp: Elem := A;
   begin
      A := B;
      B := Tmp;
   end Swap;

   procedure BBSort(T: in out TArray) is
      swapped: Boolean:= True;
   begin
      while swapped loop
         swapped := False;
         for i in T'Range loop
            if i /= T'Last then
               if T(i) > T(Index'Succ(i)) then
                  Swap(T(i), T(Index'Succ(i)));
                  swapped := True;
               end if;
            end if;
         end loop;
      end loop;
   end BBSort;

   function AddRecur(T: TArray) return Elem is
   begin
      if T'Length > 1 then
         return T(T'First) + AddRecur( T(Index'Succ(T'First)..T'Last) );
      else
         return T(T'First);
      end if;
   end AddRecur;

   function SumDiag(M: Matrix) return Matrix_pack.Elem is
      s: Matrix_pack.Elem := 0;
   begin
      for i in M'Range(1) loop
         for j in M'Range(2) loop
            if i - M'First(1) = j - M'First(2) then
               s := s + M(i, j);
            end if;
         end loop;
      end loop;
      return s;
   end SumDiag;

   procedure LocalMax(M: Matrix) is
      min_col: TArray(M'Range(2));
      min_val, max_val: Elem;
   begin
      for j in M'Range(2) loop
         min_val := Elem'Last;
         for i in M'Range(1) loop
            if min_val > M(i, j) then
               min_val := M(i, j);
            end if;
         end loop;
         min_col(j - M'First(2) + min_col'First) := min_val;
      end loop;
      for i in M'Range(1) loop
         max_val := Elem'First;
         for j in M'Range(2) loop
            if max_val < M(i, j) then
               max_val := M(i, j);
            end if;
         end loop;
         for j in M'Range(2) loop
            if max_val = M(i, j) then
               if max_val = min_col(j - M'First(2) + min_col'First) then
                  Put_Line("(" & Index'Image(i - M'First(1) + 1) & ","
                           & Index'Image(j - M'First(2) + 1) & ")="
                           & Elem'Image(max_val));
               end if;
            end if;
         end loop;
      end loop;
   end LocalMax;

   procedure Looping(X: in out Index; Y: in out Index; dx: in out Index; dy: in out Index) is
   begin
      while
        (X + XI(dx) <= M1'Last(1)) and then
        (X + XI(dx) >= M1'First(1)) and then
        (Y + YI(dy) <= M1'Last(2)) and then
        (Y + YI(dy) >= M1'First(2)) and then
        (visited(X + XI(dx) - M1'First(1) + visited'First(1), Y + YI(dy) - M1'First(2) + visited'First(2)) = 0) loop
         visited(X + XI(dx) - M1'First(1) + visited'First(1), Y + YI(dy) - M1'First(2) + visited'First(2)) := 1;
         X := X + XI(dx);
         Y := Y + YI(dy);
         Put(Elem'Image(M1(X, Y)) & " ");
         cnt := cnt + 1;
         if dx = XI'First then
            if Y = M1'Last(2) then
               return;
            end if;
         end if;
         if dx = XI'First + 1 then
            if X = M1'Last(1) then
               return;
            end if;
         end if;
         if dx = XI'First + 2 then
            if Y = M1'First(2) then
               return;
            end if;
         end if;
         if dx = XI'First + 3 then
            if X = M1'First(1) then
               return;
            end if;
         end if;
      end loop;
   end Looping;

   procedure Spiral(X: in out Index; Y: in out Index; dx: in out Index; dy: in out Index) is
   begin
      if cnt = size then
         return;
      end if;
      Looping(X, Y, dx, dy);
      dx := dx + 1;
      dy := dy + 1;
      if (dx > XI'Last) then
         dx := XI'First;
      end if;
      if (dy > YI'Last) then
         dy := YI'First;
      end if;
      Spiral(X, Y, dx, dy);
   end Spiral;

begin
--     Put_Line(Elem'Image( T(T'First + 2)));
--     Put_Line(Elem'Image(AddRecur(T)));
--     BBSort(T);
--     for i in T'Range loop
--        Put_Line(Elem'Image( T(i) ));
--     end loop;
--     Put_Line(Matrix_pack.Elem'Image( SumDiag(M) ));
   LocalMax(M1);
--     cnt := 1;
--     visited(XX - M1'First(1) + visited'First(1), YY - M1'First(2) + visited'First(2)) := 1;
--     Put(Elem'Image(M1(XX, YY)) & " ");
--     Spiral(XX, YY, DX, DY);
end Main;
