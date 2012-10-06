declare X
fun lazy {MakeNaturals X}
   X|{MakeNaturals X+1}
end

X = {MakeNaturals 1}
{Browse X}

{Browse {Nth {MakeNaturals 1} 6}}