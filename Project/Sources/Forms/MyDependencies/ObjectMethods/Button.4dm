
var $name : Text
$name:=Request:C163("Provide name of project folder in sibling folder (TODO: propose a list?)")

If (OK=1)
	
	AddDependency($name)
	
	Form:C1466.dependencies:=ReadDependencies()
	
End if 