declare
fun {NewPortObject2 Proc}
   Sin in
   thread for Msg in Sin do {Proc Msg} end end
   {NewPort Sin}
end

proc {ServerProc Msg}
   {Browse servergot(Msg)}
   case Msg
   of add(X1 X2 Y) then
      Y = X1 + X2
   [] sub(X1 X2 Y) then
      Y = X1 - X2
   [] divide(X1 X2 Y) then
      Y = X1 div X2
   [] mult(X1 X2 Y) then
      Y = X1 * X2
   end
end

Server = {NewPortObject2 ServerProc}

proc {ClientProc Msg}
   {Browse clientgot(Msg)}
   case Msg
   of work(?Y) then Y1 Y2 Y3 Y4 in
      {Send Server add(10 10 Y1)} % prints servergot(add(10 10 20))
      {Wait Y1}
      {Send Server sub(10 10 Y2)} % prints servergot(sub(10 10 0))
      {Wait Y2}
      {Send Server mult(10 10 Y3)} % prints servergot(mult(10 10 100))
      {Wait Y3}
      {Send Server divide(10 10 Y4)} % prints servergot(divide(10 10 1))
      {Wait Y4}
      Y=Y1+Y2+Y3+Y4
   end
end

Client = {NewPortObject2 ClientProc}
{Browse {Send Client work($)}} % prints 121