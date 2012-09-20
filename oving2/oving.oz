\insert 'List.oz'
declare
fun {ApplyMoves State Moves}
   0
end

fun {ApplyMove State Move}
   case Move of trackA(N) then
      state(main:1 trackA:1 trackB:1)
   else
      state(main:0 trackA:0 trackB:0)
   end
end
{Browse {ApplyMove state(main:1 trackA:1 trackB:1) trackA(1)}}
%{ApplyMoves state(main:[a b] trackA:nil trackB:nil) [trackA(1) trackB(1) trackA(~1)]}