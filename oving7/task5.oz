%Task 5:

declare
fun {IntLister Start End}
   {Delay 100}
   if Start == End then
      nil
   else
      Start|{IntLister Start+1 End}
   end
end

fun {Sum S X}
   if X.2 == nil then
      S+X.1
   else
      S+X.1 | {Sum S+X.1 X.2}
   end
end


local X in
   thread X = {IntLister 0 10} end
   {Browse X}
end

local X Y  in
   thread X = {IntLister 0 10} end
   thread Y = {Sum 0 X} end
   {Browse Y}
end

% Vi ser at det er meningen at output skal starte på 0|0|..., men vår starter på 0|... fordi vi ikke forstår hvorfor den ellers burde starte på 0|0|...
