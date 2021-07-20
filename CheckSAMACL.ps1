$Detect = @("builtin\users","builtin\utilisateurs")
$CheckACL = (Get-Acl "$env:SystemDrive\windows\system32\config\sam").Access
$Detected = $false
foreach ($IDRef in $CheckACL){if ($IDRef.IdentityReference.Value.ToLower() -in $Detect -and $IDRef.FileSystemRights.ToString().ToLower().Contains("read")){$Detected = $true}}
return $Detected