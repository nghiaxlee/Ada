with has_repetition;
with Most_frequent;
with Ada.Text_IO; use Ada.Text_IO;
procedure Test is
   -- s: String := "";
   s: String := "a";
--     s: String := "ab";
   -- s: String := "ab";
   -- s: String := "ab";
   -- s: String := "ab";
--     s: String := "Hello, I am going home";

   function Has_Double_Letters is new has_repetition(Character, Positive, String);
   function Most_frequent_letters is new most_frequent(Character, Positive, String);
begin
   if s'Length > 1 and then Has_Double_Letters(s) then
      Put_Line("Has double");
   end if;
   if s'Length > 0 then
      Put_Line(Character'Image(Most_frequent_le.tters(s)));
   end if;
end Test;
