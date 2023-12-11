//%attributes = {}
#DECLARE($name : Text)

If (Length:C16($name)=0)
	return 
End if 

var $dependenciesFile : 4D:C1709.File
$dependenciesFile:=GetDependenciesFile

var $dependencies : 4D:C1709.Object
$dependencies:=JSON Parse:C1218($dependenciesFile.getText())

If ($dependencies.dependencies=Null:C1517)
	$dependencies.dependencies:=New object:C1471
End if 

If ($dependencies.dependencies[$name]=Null:C1517)
	$dependencies.dependencies[$name]:=New object:C1471
End if 

$dependenciesFile.setText(JSON Stringify:C1217($dependencies))