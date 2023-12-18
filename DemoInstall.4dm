//%attributes = {}

// First check is already downloaded in sibling folder
If (Not:C34(Folder:C1567(Folder:C1567(fk database folder:K87:14).platformPath; fk platform path:K87:2).exists))
	
	ALERT:C41("You must download PackageManagerJSONEditor")
	OPEN URL:C673("https://github.com/e-marchand/PackageManagerJSONEditor/")
	return 
End if 

// Then show form to edit dependencies if component loaded

ARRAY TEXT:C222($componentsArray; 0)
COMPONENT LIST:C1001($componentsArray)

If (Find in array:C230($componentsArray; "PackageManagerJSONEditor")>0)
	
	EXECUTE METHOD:C1007("ShowPackageManagerForm")
	
Else 

	// else install it as dependencies
	var $dependencies : Object
	$dependencies:={dependencies: {PackageManagerJSONEditor: {}}}

	Folder:C1567(fk database folder:K87:14).file("Project/Sources/dependencies.json").setText(JSON Stringify:C1217($dependencies))  // ⚠️ if exists overwrite
	CONFIRM:C162("4D will restart to reload dependencies"; "Restart")
	If (OK=1)
		RESTART 4D:C1292
	End if 
	
End if 

