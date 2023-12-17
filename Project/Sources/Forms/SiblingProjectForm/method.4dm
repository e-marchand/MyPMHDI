

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		
		Form:C1466.ok:=False:C215
		
		
		Form:C1466.siblings:=New object:C1471
		
		Form:C1466.siblings.values:=GetSiblings()
		
		If (Value type:C1509(Form:C1466.dependencies)=Is collection:K8:32)
			// remove already added
			var $names : Collection
			$names:=Form:C1466.dependencies.extract("name")
			Form:C1466.siblings.values:=Form:C1466.siblings.values.filter(Formula:C1597(Not:C34($names.includes($1.value))))
			
		End if 
		
		//Form.siblings.currentValue:=Form.siblings.values.first() || ""
		
		
	Else 
		
End case 