//%attributes = {}
#DECLARE() : Collection

var $root : 4D:C1709.Folder
$root:=Folder:C1567(Folder:C1567(fk database folder:K87:14; *).platformPath; fk platform path:K87:2)

var $folders : Collection
$folders:=$root.parent.folders()

$folders:=$folders.filter(Formula:C1597(IsAProjectFolder($1.value)))

$folders:=$folders.filter(Formula:C1597(Not:C34($1.value.fullName=$root.fullName)))

$folders:=$folders.map(Formula:C1597($1.value.fullName))

return $folders.sort()

