#Remedy
$Detect = @("builtin\users","builtin\utilisateurs")
$CheckACL = Get-Acl "$env:SystemDrive\windows\system32\config\sam"
$Files = @("sam","security","system")
foreach ($access in $CheckACL.Access){
    if ($access.IdentityReference.Value -in $Detect){
        foreach ($File in $Files){
            & icacls "$env:SystemDrive\windows\system32\config\$($File)" /inheritance:d # Had to Break Inheritance
            & icacls "$env:SystemDrive\windows\system32\config\$($File)" /remove $access.IdentityReference.Value
        }
    }
}