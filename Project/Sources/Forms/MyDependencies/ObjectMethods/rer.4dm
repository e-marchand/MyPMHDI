
If (Form:C1466.selected#Null:C1517)
	
	var $names : Collection
	$names:=Form:C1466.selected.extract("name")
	RemoveDependencies($names)
	RemoteDepencenciesFromEnv($names)
	
	Form:C1466.dependencies:=ReadDependencies()  // refresh
	
End if 