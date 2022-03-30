package body Binary_Search
  with SPARK_Mode
is
   ----------------------------------------------------
   --     SPARK 2014 - Binary_Search Example         --
   --                                                --
   -- This example illustrates the use of loop       --
   -- invariants and variants in the proof of a      --
   -- binary search algorithm.                       --
   ----------------------------------------------------

   function Search (A : Ar; I : Integer) return T is
      Left  : U;
      Right : U;
      Med   : U;
   begin
      Left  := Ar'First;
      Right := Ar'Last;

      if A (Left) > I or else A (Right) < I then
         return 0;
      end if;

      while Left <= Right loop
         pragma Loop_Invariant (True); -- COMPLETE THIS
         pragma Loop_Variant (Decreases => Natural(0)); -- COMPLETE THIS

         Med := Left + (Right - Left) / 2;

         if A (Med) < I then
            Left := Med + 1;
         elsif A (Med) > I then
            Right := Med - 1;
         else
            return Med;
         end if;
      end loop;

      return 0;
   end Search;

end Binary_Search;