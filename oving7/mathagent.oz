declare
fun {NewPortObject Init Fun}
   Sin Sout in
   thread {FoldL Sin Fun Init Sout} end
   {NewPort Sin}
end


fun {MathAgent}
   {NewPortObject 0
    fun {$ State Msg}
       case Msg
       of get(X) then
	  X=State
       [] add(X) then
	  State + X
       [] sub(X) then
	  State - X
       [] divide(X) then
	  State / X
       [] mult(X) then
	  State * X
       end
    end}       
end

MathPObj = {MathAgent}
{Send MathPObj add(3)}
{Send MathPObj sub(7)}
{Browse {Send MathPObj get($)}} % displays ~4

{Send MathPObj add(27)}
{Browse {Send MathPObj get($)}} % displays 23

MathPObj2 = {MathAgent}
{Send MathPObj2 mult(27)}
{Browse {Send MathPObj2 get($)}}

















