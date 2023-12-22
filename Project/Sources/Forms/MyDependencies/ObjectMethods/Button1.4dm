
var $winRef : Integer
$winRef:=Open form window:C675("EnvironmentAddFolder"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)

DIALOG:C40("EnvironmentAddFolder"; Form:C1466)


If (Bool:C1537(Form:C1466.ok) && (Form:C1466.newFolder.folder#Null:C1517))
	
	If (Form:C1466.newFolder.envFolder#Null:C1517)
		Form:C1466.newFolder.envFolder.file("environment4d.json").setText("{}")
	End if 
	
	If (Form:C1466.newFolder.name#Null:C1517)
		AddDependencyFolder(Form:C1466.newFolder.folder; Form:C1466.newFolder.name)
	Else 
		AddDependencyFolder(Form:C1466.newFolder.folder)
	End if 
	
	Form:C1466.dependencies:=ReadDependencies()
	
End if 
