with Loop_Types; use Loop_Types;

procedure Map_Arr_Incr (A : in out Arr_T) with
  SPARK_Mode,
  Pre  => (for all J in A'Range => A(J) /= Component_T'Last),
  Post => (for all J in A'Range => A(J) = A'Old(J) + 1)
is
begin
   for J in A'Range loop
      A(J) := A(J) + 1;
      -- Forklaring: alle de elementer, som har et index mindre end J har ændret sig 
      -- siden at løkken startede og dem som har et index højere end J, har vi ikke ændret.
      pragma Loop_Invariant ((for all I in A'First..J => A (I) = A'Loop_Entry (I) + 1) and then 
                             (for all I in J+1..A'Last => A (I) = A'Loop_Entry (I)));
   end loop;
end Map_Arr_Incr;
