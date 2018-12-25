cd c:\dbscripts
deleteold.ps1 -FolderPath j:\backups -FileAge 1 -IncludePath .*trans*. -RegExPath  -LogFile ./log.log
