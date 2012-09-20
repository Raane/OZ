\insert 'List.oz'
declare
fun {Find Xs Ys}
   local Split in
      if Xs == nil then
	 nil
      elseif Xs.1 == Ys.1 then
	 {Find Xs.2 Ys.2}
      else
	 Split = {SplitTrain Xs Ys.1}
	 case Split of G#H then
	    trackA({Length H}+1) | trackB({Length G}) | trackA(~{Length H}-1) | trackB(~{Length G}) | {Find {Append H G} Ys.2}
	 end
      end
      
   end
      
end

fun {SplitTrain Xs Y}
   local P in
      P = {Position Xs Y}
      {Take Xs P-1}#{Drop Xs P}
   end
end

{Browse {Find [b a] [a b]}}