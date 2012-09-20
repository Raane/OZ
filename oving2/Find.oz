\insert 'List.oz'
declare
fun {Find Xs Ys}
   {Browse Xs}
   {Browse Ys}
   local Split in
      if Xs == nil then
	 nil
      else
	 Split = {SplitTrain Xs Ys.1}
	 {Browse Split}
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

{Browse {Find [a b] [b a]}}