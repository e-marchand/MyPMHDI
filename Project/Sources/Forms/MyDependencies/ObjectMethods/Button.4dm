
var $winRef : Integer
$winRef:=Open form window:C675("SiblingProjectForm"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)

DIALOG:C40("SiblingProjectForm"; Form:C1466)



If (Bool:C1537(Form:C1466.ok) && (Length:C16(Form:C1466.siblings.currentValue)>0))
	
	AddDependency(Form:C1466.siblings.currentValue)
	
	Form:C1466.dependencies:=ReadDependencies()
	
End if 