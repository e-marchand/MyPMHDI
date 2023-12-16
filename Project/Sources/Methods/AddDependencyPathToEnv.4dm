//%attributes = {}
#DECLARE($folder : 4D:C1709.Folder; $optionalName : Text)

var $name : Text
$name:=Length:C16($optionalName)>0 ? $optionalName : $folder.fullName

var $envFile : 4D:C1709.File
$envFile:=GetEnvFile()



var $env : Object
If (Not:C34($envFile.exists))
	$env:=New object:C1471("dependencies"; New object:C1471)
Else 
	$env:=JSON Parse:C1218($envFile.getText())
	If ($env.dependencies=Null:C1517)  // XXX check obj to more safe code
		$env.dependencies:=New object:C1471
	End if 
End if 

// TODO: here could try to make relative link if needed, like ../ or ./ according to $envFolder
// else absolute file url
$env.dependencies[$name]:=FileUrl($folder)

$envFile.setText(JSON Stringify:C1217($env; *))
