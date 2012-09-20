declare
fun {Length Xs}
   if Xs==nil then
      0
   else
      1 + {Length Xs.2}
   end
end

fun {Take Xs N}
   if N==0 then
      nil
   elseif N>={Length Xs} then
      Xs
   else
      Xs.1|{Take Xs.2 N-1}
   end
end

fun {Drop Xs N}
   if Xs==nil then
      nil
   elseif N==1 then
      Xs.2
   elseif N==0 then
      Xs
   else
      {Drop Xs.2 N-1}
   end
end   

fun {Append Xs Ys}
   if Xs==nil then
      Ys
   else
      Xs.1|{Append Xs.2 Ys}
   end
end

fun {Member Xs Y}
   if Xs==nil then
      false
   elseif Xs.1==Y then
      true
   else
      {Member Xs.2 Y}
   end
end

fun {Position Xs Y}
   if Xs.1==Y then
      1
   else
      1 + {Position Xs.2 Y}
   end
end