
var $folderSysPath : Text


var $baseFolder; $selecteFolder; $parentFolder : 4D:C1709.Folder
$baseFolder:=Folder:C1567(Folder:C1567(fk database folder:K87:14; *).platformPath; fk platform path:K87:2)


$folderSysPath:=Select folder:C670("Select base folder or one of parent folders"; $baseFolder.parent.platformPath)


$selecteFolder:=Folder:C1567($folderSysPath; fk platform path:K87:2)

$parentFolder:=$baseFolder
var $ok : Boolean
$ok:=False:C215
While (Not:C34($ok) && (Not:C34($parentFolder=Null:C1517)))
	
	If ($selecteFolder.path=$parentFolder.path)
		$ok:=True:C214
	End if 
	
	$parentFolder:=$parentFolder.parent
End while 

If (Not:C34($ok))
	
	ALERT:C41("You must select a parent folder.")
	
Else 
	
	Form:C1466.newFolder.envFolder:=$selecteFolder
	Form:C1466.envFile:=$selecteFolder.file("environment4d.json")
	
End if 

