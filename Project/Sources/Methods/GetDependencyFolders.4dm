//%attributes = {}
// return folders of dependencies, by reproducing 4d internal algo
#DECLARE() : Collection

var $dependenciesFile : 4D:C1709.File
$dependenciesFile:=GetDependenciesFile

If (Not:C34($dependenciesFile.exists))
	return New collection:C1472
End if 

var $dependencies : 4D:C1709.Object
$dependencies:=JSON Parse:C1218($dependenciesFile.getText())
If ($dependencies.dependencies=Null:C1517)
	return New collection:C1472  // just empty, not yet defined
End if 


var $envFile : 4D:C1709.File
$envFile:=GetEnvFile()

var $env : Object
If ($envFile.exists)
	$env:=JSON Parse:C1218($envFile.getText()).dependencies
End if 

//ARRAY TEXT($componentsArray; 0)
//COMPONENT LIST($componentsArray) // maybe to filter only loaded
// Also maybe filter on folder exists?

var $dependencyCollection : Collection
$dependencyCollection:=New collection:C1472

var $defaultFolder : 4D:C1709.Folder
$defaultFolder:=Folder:C1567(Folder:C1567(fk database folder:K87:14; *).platformPath; fk platform path:K87:2).parent


var $name : Text
For each ($name; $dependencies.dependencies)
	
	If (($env=Null:C1517) || ($env[$name]=Null:C1517) || (Length:C16(String:C10($env[$name]))=0))
		
		$dependencyCollection.push($defaultFolder.folder($name))
		
	Else 
		
		Case of 
			: Position:C15("file://"; $env[$name])=1
				
				$dependencyCollection.push(DecodeFileURL($env[$name]))
				
			: Position:C15("../"; $env[$name])=1
				
				If (Not:C34($envFile.parent.parent=Null:C1517))
					$dependencyCollection.push($envFile.parent.parent.folder(Substring:C12($env[$name]; 4)))
				End if 
				
			: Position:C15("./"; $env[$name])=1
				
				$dependencyCollection.push($envFile.parent.folder(Substring:C12($env[$name]; 3)))
				
			Else 
				
		End case 
		
		
	End if 
	
End for each 

return $dependencyCollection
