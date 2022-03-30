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
         -- Forklaring:
         -- Loop Invariant: 
         --   Hvad vi ved om en binær søgning er guard'en for while loopet
         --   garanterer at det venstre index er mindre eller lig med det højre.
         --   Derudover kan vi sige at alle elementer som ligger "uden for"
         --   det indre område mellem Left og Right kan ikke være af værdien I
         pragma Loop_Invariant (Left <= Right and 
            (for all J in A'First..Left-1 => A (J) /= I) and 
            (for all J in Right+1..A'Last => A (J) /= I));
         pragma Loop_Variant (Decreases => Right - Left);

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
