declare
fun {NewPortObject Init Fun}
   Sin Sout in
   thread {FoldL Sin Fun Init Sout} end
   {NewPort Sin}
end

fun {NewPortObject2 Proc}
   Sin in
   thread for Msg in Sin do {Proc Msg} end end
   {NewPort Sin}
end

% Messages sent to the Dating Service 
% seeking(MySex MeDescription OtherSex OtherDescription ResponsePort) 
% Messages sent by the Dating service on ResponsePort 
%	list(CompatiblePeople) 
%	match(CompatiblePerson) 

%% The port object factory
fun {NewDatingService}
   Startstate = state(men: nil women: nil)

   fun {Receive state(men: Men women: Women) Msg}
      case Msg of
	 seeking(MySex MyDesc OtherSex OtherDesc RP) then

	 local
	    WantedSexList = if OtherSex==male then Men else Women end
	    Compatible = {Filter WantedSexList
			  fun {$ seeking(Tsex Tdesc Osex Odesc Orp)}
			    Osex==MySex andthen Odesc==MyDesc andthen OtherDesc==Tdesc
			  end
			 }
	 in
	    if Compatible \= nil then
	       {Send RP list(Compatible)}

	       for seeking(Tsex Tdesc Osex Odesc Orp) in Compatible do
		  {Send Orp match(MySex MyDesc OtherSex OtherDesc RP)}
	       end
	    end    

	    if MySex==male then
	       state(men: Msg|Men women: Women)
	    else
	       state(men: Men women: Msg|Women)
	    end    
	 end
      end
   end

in
   {NewPortObject Startstate  Receive}
end 

DatingService = { NewDatingService } 

fun {NewClient Name MySex MyDesc OtherSex OtherDesc} 
   RP = { NewPortObject2
	  proc {$ Msg} 
	     {Browse Name#' got '#Msg}
	  end}
in 
   {Send DatingService seeking(MySex MyDesc OtherSex OtherDesc RP)} 
   RP
end 

Alice = {NewClient 'Alice' female blond male dark} 
Bob = {NewClient 'Bob' male dark female blond} 
Candice = {NewClient 'Candice' female blond male dark} 
Dale = {NewClient 'Dale' male dark female blond} 
Elise = {NewClient 'Elise' female brunette male blond} 
Fred = {NewClient 'Fred' male blond female brunette} 
{Browse done}
