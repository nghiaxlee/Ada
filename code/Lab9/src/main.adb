with hauntedhouse, ADA.Text_IO, Ada.Numerics.Discrete_Random;
use hauntedhouse, Ada.text_io;

procedure Main is

   task Princess is
      entry scare(ghost: Position);
   end Princess;

   package king is new Ada.Numerics.Discrete_Random(Boolean);
   use king;

   task body Princess is
      pos: Position := (1, 3);
      nxt: Position;
      life: Natural := 3;
      moved: Boolean;
      k: king.Generator;
   begin
      while (life > 0 and GetField(pos) /= E) loop
         if (life = 1) then
            if (Random(k)) then
               Put_Line("All hail the King!!");
               life := life + 1;
            end if;
         end if;
         moved := False;
         while not moved loop
            nxt := GetRandPos;
            if (IsCorrect(nxt) and
                abs(nxt.x - pos.x) + abs(nxt.y - pos.y) = 1) then
               moved := True;
               pos := nxt;
               Put_Line("Princess pos:" & Positive'Image(pos.x) & Positive'Image(pos.y));
            end if;
         end loop;
         select
            when (GetField(pos) = C) =>
               accept scare(ghost: Position) do
                  if (pos.x = ghost.x and pos.y = ghost.y) then
                     life := life - 1;
                     Put_Line("Scared, life left: " & Natural'Image(life));
                  end if;
               end scare;
         or
            delay 0.2;
         end select;
      end loop;
      if (life = 0) then
         Put_Line("Died T_T");
      else
         Put_Line("Yeahhh!!");
      end if;
   end Princess;

   type PDuration is access Duration;

   task type Ghost(id: Positive; d: PDuration);
   task body Ghost is
      pos: Position;
   begin
      while Princess'Callable loop
         pos := GetRandPos;
         Put_Line("Ghost" & Positive'Image(id) & Natural'Image(pos.x) & Natural'Image(pos.y));
         select
            Princess.scare(pos);
         or
            delay d.all;
         end select;
         delay 0.2;
      end loop;
   end Ghost;

   --     Ghosts: array(1..3) of Ghost;
   type PGhost is access Ghost;

   task type Wizard(ng: Natural; d: PDuration);
   task body Wizard is
      g: array (1..ng) of PGhost;
   begin
      for i in 1..ng loop
         g(i) := new Ghost(i, d);
      end loop;
   end Wizard;

   x: Wizard(100, new Duration'(0.5));
begin
   --  Insert code here.
   null;
end Main;
