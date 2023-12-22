
If (Form event code:C388=On Load:K2:1)
	
	Form:C1466.newFolder:=New object:C1471
	
	Form:C1466.envFile:=GetEnvFile
	
	OBJECT SET VISIBLE:C603(*; "EnvFolderButton"; Not:C34(Form:C1466.envFile.exists))
	
	Form:C1466.ok:=False:C215
	
End if 