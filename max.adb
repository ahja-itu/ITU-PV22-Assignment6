package body Max 
   with SPARK_Mode  
is

   function Arrays_Max (A : in Our_Array) return Index_Range is
      X : Index_Range := Index_Range'First;
      Y : Index_Range := Index_Range'Last;
   begin
      while X /= Y loop
         pragma Loop_Invariant (True); -- COMPLETE THIS
         pragma Loop_Variant (Decreases => Natural(0)); -- COMPLETE THIS

         if A (X) <= A (Y) then
            X := X + 1;
         else
            Y := Y - 1;
         end if;
      end loop;
      return X;
   end Arrays_Max;

end Max;
