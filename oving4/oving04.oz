declare
fun lazy {StreamMap S F}
   {F S.1}|{StreamMap S.2 F}
end

fun lazy {StreamZip S1 S2 F}
   {F S1.1 S2.1}|{StreamZip S1.2 S2.2 F}
end


fun {Add X Y}
   X+Y
end

fun lazy {MakeNaturals X}
   X|{MakeNaturals X+1}
end


{Browse {Nth {StreamZip {MakeNaturals 1} {MakeNaturals 1} Add} 2}}