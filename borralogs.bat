cd c:\dbscripts
powershell.exe -ExecutionPolicy Bypass -Command ".\deleteold.ps1 -FolderPath e:\backup\PRB -FileAge 1 -LogFile ./log.log"
