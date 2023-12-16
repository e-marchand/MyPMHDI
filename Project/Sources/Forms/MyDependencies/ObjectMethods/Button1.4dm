
var $folderSysPath : Text
$folderSysPath:=Select folder:C670

If (OK=1)
	
	AddDependencyFolder(Folder:C1567($folderSysPath; fk platform path:K87:2))
	
	Form:C1466.dependencies:=ReadDependencies()
	
End if 