//%attributes = {}
#DECLARE() : 4D:C1709.File

var $file : 4D:C1709.File
$file:=Folder:C1567(fk database folder:K87:14; *).file("Project/Sources/dependencies.json")

If (Not:C34($file.exists))
	$file.setText(JSON Stringify:C1217(New object:C1471("dependencies"; New object:C1471)))
End if 

return $file