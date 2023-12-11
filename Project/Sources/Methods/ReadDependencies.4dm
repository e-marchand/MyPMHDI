//%attributes = {}
#DECLARE() : Collection
var $dependenciesFile : 4D:C1709.File
$dependenciesFile:=GetDependenciesFile

var $dependencies : 4D:C1709.Object
$dependencies:=JSON Parse:C1218($dependenciesFile.getText())
If ($dependencies.dependencies=Null:C1517)
	$dependencies.dependencies:=New object:C1471
End if 


ARRAY TEXT:C222($componentsArray; 0)
COMPONENT LIST:C1001($componentsArray)
var $isLoaded : Boolean
var $dependencyCollection : Collection
$dependencyCollection:=New collection:C1472

var $name : Text
For each ($name; $dependencies.dependencies)
	
	$isLoaded:=Find in array:C230($componentsArray; $name)>0
	$dependencyCollection.push(New object:C1471("name"; $name; "loaded"; $isLoaded))
	
End for each 

return $dependencyCollection
