
var $folderSysPath : Text

$folderSysPath:=Select folder:C670("Choose a 4d project folder"; Folder:C1567(Folder:C1567(fk database folder:K87:14; *).platformPath; fk platform path:K87:2).parent.platformPath; Package open:K24:8)


If (OK=1)
	
	If (Not:C34(IsAProjectFolder(Folder:C1567($folderSysPath; fk platform path:K87:2))))
		ALERT:C41("Not a 4D project folder")
		return 
	End if 
	
	Form:C1466.newFolder.folder:=Folder:C1567($folderSysPath; fk platform path:K87:2)
	
	If (Length:C16(String:C10(Form:C1466.newFolder.name))=0)
		Form:C1466.newFolder.name:=Form:C1466.newFolder.folder.fullName
	End if 
	
End if 