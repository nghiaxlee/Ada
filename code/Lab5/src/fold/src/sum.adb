with Ada.Text_IO;
use Ada.Text_IO;

procedure Sum is

    type Index is new Integer;
    type Elem is new Integer;
    type Tömb is array (Index range <>) of Elem;

    function Add_all ( T: Tömb ) return Elem is
        S: Elem := 0;
    begin
        for I in T'Range loop
	    S := S + T(I);
        end loop;
        return S;
    end Add_all;
   i: Index;
   j: Integer;
begin
   i := 10;
   j := 11;
--     i := Index(j);
   j := Integer(i);
   Put_Line(Integer'Image(j));
   Put_Line( Elem'Image( Add_all((3,2,5,7,1)) ) );

end Sum;
