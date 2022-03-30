with Loop_Types; use Loop_Types;

procedure Search_Arr_Zero (A : Arr_T; Pos : out Opt_Index_T; Success : out Boolean) with
  SPARK_Mode,
  Post => Success = (for some J in A'Range => A(J) = 0) and then
          (if Success then A (Pos) = 0)
is
begin
   for J in A'Range loop
      if A(J) = 0 then
         Success := True;
         Pos := J;
         return;
      end if;
      -- Denne her loop invariant bliver checket når vi er i loopet.
      -- Vi ser på alle væriderne fra det første index og op til J, og
      -- kan bestemme at loopet ikke er stoppet fordi at vi ikke har nået
      -- guarden fra if-statement'et om at A (J) = 0.
      pragma Loop_Invariant (for all I in A'First..J => A(I) /= 0); -- COMPLETED
   end loop;

   Success := False;
   Pos := 0;
end Search_Arr_Zero;
