//%attributes = {}
#DECLARE($folder : 4D:C1709.Folder; $optionalName : Text)

var $defaultRoot : Text
$defaultRoot:=Folder:C1567(Folder:C1567(fk database folder:K87:14; *).platformPath; fk platform path:K87:2).parent.path

var $rename : Boolean
$rename:=(Length:C16($optionalName)>0) && Not:C34($folder.fullName=$optionalName)

If (Not:C34($rename) && (($defaultRoot=String:C10($folder.parent.path))))  // if sibling, to need to create env
	
	AddDependency($folder.fullName)
	
Else 
	
	AddDependency((Length:C16($optionalName)>0) ? $optionalName : $folder.fullName)
	
	AddDependencyPathToEnv($folder; $optionalName)
	
End if 