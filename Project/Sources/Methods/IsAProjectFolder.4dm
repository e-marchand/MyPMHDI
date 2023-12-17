//%attributes = {}
#DECLARE($folder : 4D:C1709.Folder) : Boolean

var $file : 4D:C1709.Folder
For each ($file; $folder.folder("Project").files())
	
	If ($file.extension=".4DProject")
		return True:C214
	End if 
	
End for each 

For each ($file; $folder.files())
	
	If ($file.extension=".4DZ")
		return True:C214
	End if 
	
End for each 

return False:C215