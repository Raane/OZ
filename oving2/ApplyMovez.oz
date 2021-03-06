\insert 'List.oz'
\insert 'Visualizer.oz'
declare
fun {ApplyMoves State Moves}
   if Moves == nil then
      State|nil
   else
      Newstate in
      Newstate = {ApplyMove State Moves.1}
      State | {ApplyMoves Newstate Moves.2}
   end
end

fun {ApplyMove State Move}
   case Move of trackA(N) then
      if N>0 then
	 state(main:{Take State.main {Length State.main}-N} trackA:{Append {Drop State.main {Length State.main}-N} State.trackA} trackB:State.trackB)
      else
	 state(main:{Append State.main {Take State.trackA ~N}} trackA:{Drop State.trackA ~N} trackB:State.trackB)
      end
      
   [] trackB(N) then
      if N>0 then
	 state(main:{Take State.main {Length State.main}-N} trackA:State.trackA trackB:{Append {Drop State.main {Length State.main}-N} State.trackB})
      else
	 state(main:{Append State.main {Take State.trackB ~N}} trackA: State.trackA trackB:{Drop State.trackB ~N})
      end
   end
end
%{Browse {ApplyMove state(main:[a b] trackA:[c e] trackB:[d f g]) trackB(~1)}}
{Visualize {ApplyMoves state(main:[a b] trackA:nil trackB:nil) [trackA(1) trackB(1) trackA(~1)]}}
%{Visualize [state(main:[a b] trackA:nil trackB:nil)
%state(main:[a] trackA:[b] trackB:nil)
%state(main:nil trackA:[b] trackB:[a])
%state(main:[b] trackA:nil trackB:[a])]}