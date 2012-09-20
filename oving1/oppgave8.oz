declare
Keys=[[&l &o &c &a &l] [&e &n &d]  [&i &n] [&i &f]] %Denne kan ha mye mer.

/*declare
fun {ToString L}
   if L==nil then
      'a'
   else
      {String.toAtom L.1} | {ToString L.2}
   end
end*/

declare
fun {WordTokenize L}
   if L.1>&a then
      if L.1<&z then
	 if {Member L Keys} then
	    key(L)
	 else
	    atom(L)
	 end
      else
	 id(L)
      end
   else
      id(L)	
   end
end

% Vi har googlet som noen guder og finner ikke 'and' til bruk i if settninger.  Derfor den stygge hacken.

declare
fun {Tokenize L}
   if L==nil then
      nil
   else
      {WordTokenize L.1} | {Tokenize L.2}
   end
end

{Browse {Tokenize ["local" "X" "in" "if" "x" "end"]}}
%evaluates to
%[key("local") id("X") key("in") key("if") atom("x") key("end")]