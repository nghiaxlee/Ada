with ada.Text_IO;
use ada.Text_IO;

procedure Main is
   task Sand is
      entry Left;
      entry Right;
   end Sand;

   task type Shoe(curr_shoe: Integer);
   task body Shoe is
   begin
      for i in 1..5 loop
         if curr_shoe = 1 then
            sand.Left;
         else
            sand.Right;
         end if;
         delay 1.0;
      end loop;
   end Shoe;

   dmShoe : Shoe(1);
   ccShoe : Shoe(2);

   task body Sand is
      check: Boolean := True;
   begin
      Put_Line("1");
      for i in 1..10 loop
         if check then
            accept Left;
            Put_Line("Left shoe walked");
            check := false;
         else
            accept Right;
            Put_Line("Right shoe walked");
            check := true;
         end if;
      end loop;
   end Sand;

begin
   --  Insert code here.
   null;
end Main;
