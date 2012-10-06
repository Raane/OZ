% Oppgave 3 a)

declare
fun {Appendoz Xs Ys}
   case Xs
   of nil then
      Ys
   [] X|Xr then
      X|{Appendoz Xr Ys}
   end
end

declare
Appendcore = proc {$ Xs Ys Zs}
		case Xs of nil then
		   Zs=Ys
		else
		   case Xs of '|'(X Xr) then %<literal>(<feature1>:X <feature2>:Xr)
%		      {Browse Xr}
		      local Zr in Zs='|'(X Zr) {Appendcore Xr Ys Zr} end 
		   end
		end
	     end


{Browse 'Appendoz and appendcore:'}
{Browse {Appendoz [1 2 3] [4 5 6]}}
{Browse {Appendcore [1 2 3] [4 5 6]}}

% Oppgave 3 b)
declare
Max = proc {$ N M ?R}
	 local NZero in
	    NZero = {Equals N 0 NZero} % Lagrer "N===" i NZero
	    if NZero then % Sjekker
	       R = M % Setter R til M
	    else
	       local MZero in
		  MZero = {Equals M 0 MZero} % Samme for M
		  if MZero then
		     R = N
		  else
		     local NMinus in
			local MMinus in
			   {Minus N ~1 NMinus} % N-1 lagres i NMinus
			   {Minus M ~1 MMinus} % M-1
			   local New in
			      {Max NMinus MMinus New} % Lagre rekursive kallet i New
			      {Plus 1 New R} % Plusse 1 på New og sette R til resultatet
			   end
			end
		     end
		  end
	       end
	    end
	 end
      end
