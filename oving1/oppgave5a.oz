declare
fun {SumTo FirstInt LastInt}
   if FirstInt == LastInt then
      FirstInt
   else
      FirstInt + {SumTo FirstInt+1 LastInt}
   end
end

{Browse {SumTo 3 5}}