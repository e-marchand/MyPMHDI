//%attributes = {}
#DECLARE($folder : 4D:C1709.Folder) : Text

$folder:=Folder:C1567($folder.platformPath; fk platform path:K87:2)  //unbox


Case of 
	: (Is Windows:C1573)
		return "file:///"+$folder.path
	Else 
		return "file://"+$folder.path
End case 