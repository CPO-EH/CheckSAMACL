#Remedy
& icacls $env:SystemDrive\windows\system32\config\*.* /inheritance:e
& vssadmin delete shadows /for=$env:SystemDrive /Quiet