\insert 'List.oz'
declare
fun {FewerFind Ms Os Ts Ys}
   {Browse [Ms Os Ts Ys]}
   local Split in
      if Ys == nil then
	 nil
      else
	 if {Member Ms Ys.1} then
	    Split = {SplitTrain Ms Ys.1}
	    case Split of G#H then
	       trackA({Length H}+1) | trackB({Length G}) | trackA(~1) | {FewerFind nil {Append H Os} {Append G Ts} Ys.2}
	    end
	 elseif {Member Os Ys.1} then
	    Split = {SplitTrain Os Ys.1}
	    case Split of G#H then
	       trackA(~{Length G}) | trackB({Length G}) | trackA(~1) | {FewerFind nil {Drop Os {Length G}+1} {Append G Ts} Ys.2}
	    end
	 else
	    Split = {SplitTrain Ts Ys.1}
	    case Split of G#H then
	       trackB(~{Length H}) | trackA({Length H}) | trackB(~1) | {FewerFind nil {Append H Os} {Drop Ts {Length H}+1} Ys.2}
	    end
	 end
      end
   end
end



fun {Find Xs Ys}
   {Browse Xs}
   {Browse Ys}
   local Split in
      if Xs == nil then
	 nil
      elseif Xs.1 == Ys.1 then
	 {Find Xs.2 Ys.2}
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

{Browse {FewerFind [a b] nil nil [b a]}}