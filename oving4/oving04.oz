declare
% Task 2
fun lazy {StreamMap S F}
   {F S.1}|{StreamMap S.2 F}
end

% Task 3
fun lazy {StreamZip S1 S2 F}
   {F S1.1 S2.1}|{StreamZip S1.2 S2.2 F}
end

% Task 4
fun lazy {StreamScale SF Factor}
   SF.1*Factor|{StreamScale SF.2 Factor}
end

% Task 5
fun lazy {StreamAdd SF1 SF2}
   SF1.1+SF2.1|{StreamAdd SF1.2 SF2.2}
end

% Task 6
fun lazy {StreamIntegrate SF InitValue Dt}
   InitValue|{StreamIntegrate SF.2 SF.1*Dt+InitValue Dt}
end

% Task 7
fun {MakeRC R C Dt}
   fun {$ SF V0}
      local SC SCV SR in
	 SC = {StreamScale SF 1.0/C}
	 SCV = {StreamIntegrate SC V0 Dt}

	 SR = {StreamScale SF R}
	 {StreamAdd SCV SR}
      end
   end
end


% Help/Test stuff
fun lazy {MakeNaturals X}
   X|{MakeNaturals X+1}
end

fun lazy {MakeReals X}
   X|{MakeReals X+1.0}
end

fun {Add X Y}
   X+Y
end


%{Browse {Nth {StreamZip {MakeNaturals 1} {MakeNaturals 1} Add} 2}}

%{Browse {Nth {StreamScale {MakeReals 1.0} 3.0} 3}}

%{Browse {Nth {StreamAdd {MakeReals 1.0} {MakeReals 2.0}} 2}}

%{Browse {Nth {StreamIntegrate 5.0|6.0|7.0 2.0 3.0} 3} }

Streams = streams(streamMap: StreamMap
		  streamZip: StreamZip
		  streamScale: StreamScale
		  streamIntegrate: StreamIntegrate
		  streamAdd: StreamAdd
		  makeRC: MakeRC)

Test={Module.link ['SimGraph.ozf']}.1.make

{Test Streams}
