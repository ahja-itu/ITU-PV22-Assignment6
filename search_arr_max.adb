with Loop_Types; use Loop_Types;

procedure Search_Arr_Max (A : Arr_T; Pos : out Index_T; Max : out Component_T) with
  SPARK_Mode,
  Post => (for all J in A'Range => A(J) <= Max) and then
          (for some J in A'Range => A(J) = Max) and then
          A(Pos) = Max
is
begin
   Max := 0;
   Pos := A'First;

   for J in A'Range loop
      if A(J) > Max then
         Max := A(J);
         Pos := J;
      end if;
      pragma Loop_Invariant ((for all I in A'First..J => A (I) <= Max) and A (Pos) = Max);  -- COMPLETE THIS
   end loop;
end Search_Arr_Max;
