//%attributes = {}
#DECLARE() : 4D:C1709.File
var $envFile : 4D:C1709.File
var $envFolder : 4D:C1709.Folder
$envFolder:=Folder:C1567(Folder:C1567(fk database folder:K87:14; *).platformPath; fk platform path:K87:2)

$envFile:=$envFolder.file("environment4d.json")

While (Not:C34($envFile.exists) && Not:C34($envFolder=Null:C1517))
	$envFolder:=$envFolder.parent
	If (Not:C34($envFolder=Null:C1517))
		$envFile:=$envFolder.file("environment4d.json")
	End if 
End while 

If (Not:C34($envFile.exists))
	$envFolder:=Folder:C1567(Folder:C1567(fk database folder:K87:14; *).platformPath; fk platform path:K87:2)  // default in base (but ould change to parent
	$envFile:=Folder:C1567(fk database folder:K87:14; *).file("environment4d.json")
End if 

return $envFile