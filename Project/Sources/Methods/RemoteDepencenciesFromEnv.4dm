//%attributes = {}
#DECLARE($names : Collection)

var $dependenciesFile : 4D:C1709.File
$dependenciesFile:=GetEnvFile

If (Not:C34($dependenciesFile.exists))
	return 
End if 

var $dependencies : 4D:C1709.Object
$dependencies:=JSON Parse:C1218($dependenciesFile.getText())

If ($dependencies.dependencies#Null:C1517)
	var $name : Text
	For each ($name; $names)
		OB REMOVE:C1226($dependencies.dependencies; $name)
	End for each 
	
	$dependenciesFile.setText(JSON Stringify:C1217($dependencies))
	
End if 
