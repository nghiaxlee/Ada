with PSet, Ada.Integer_Text_IO, Ada.Text_IO;

procedure Main is
   package MySet is new PSet(Character);
   use MySet;
   A: TArray := "ABCDA";
   B: TArray := "ABDE";
   -- A: TArray := (1, 2, 3, 4); bi loi Overflow.
   S: Set;
   T: Set;
   SuT: Set;
   SiT: Set;
   X: Character;
begin
   --     for i in A'Range loop
   --        Ada.Text_IO.Put(A(i));
   --     end loop;
   S := Make_Set(A);
   print_Set(S);
   declare
      E: TArray(1..Size(S));
   begin
      E := Decompose(S);
      for i in E'Range loop
         Ada.Text_IO.Put(E(i));
      end loop;
   end;

   T := Make_Set(B);
   print_Set(T);
   if Contains(S, T) then
      Ada.Text_IO.Put_Line("T contains S");
   end if;

   SuT := S + T;
   SiT := S * T;
   Ada.Text_IO.Put_line("Union S T:");
   print_Set(SuT);
   Ada.Text_IO.Put_line("Intersection S T:");
   print_Set(SiT);
   X := 'C';
   if X < S then
      Ada.Text_IO.Put("S has ");
      Ada.Text_IO.Put_line(Character'Image(X));
   end if;
end Main;
