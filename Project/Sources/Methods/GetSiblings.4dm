//%attributes = {}
#DECLARE() : Collection


$folders:=Folder:C1567(Folder:C1567(fk database folder:K87:14; *).platformPath; fk platform path:K87:2).parent.folders()

$folders:=$folders.filter(Formula:C1597(IsAProjectFolder($1.value)))

$folders:=$folders.map(Formula:C1597($1.value.fullName))

return $folders

