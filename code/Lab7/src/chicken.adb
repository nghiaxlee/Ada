with ada.Text_IO;
use ada.Text_IO;

procedure Chicken is

   GONE: Exception;
   type Events is (Fed, Consume);

   task Chick is
      entry Action(what: in Events);
   end CHick;

   task body Chick is
      Seeds: Positive := 4;
   begin
      Put_Line("Seeds: " & Natural'Image(Seeds));
      while Seeds < 30 loop
         -- TODO: use select.
         accept Action(what: in Events) do
            case what is
               when Fed => Seeds := Seeds + 3;
               when Consume => Seeds := Seeds - 1;
            end case;
            Put_Line("Seeds: " & Positive'Image(Seeds));
         end Action;
      end loop;
      Put_Line("Fly away");
   exception
      when Constraint_Error => raise GONE;
   end Chick;

   task Child;
   task body Child is
   begin
      Put_Line("Inside Child");
      loop
         Chick.Action(Consume);
      end loop;
   exception
      when GONE => Put_Line("Sad");
   end Child;

begin
   --  Insert code here.
   null;
end Chicken;
