use master
go
dump database master to "j:\backups\master.bak" with compression="4"
go
use saptools
go
dump database saptools to "j:\backups\saptools.bak" with compression="4"
go
use sybmgmtdb
go
dump database sybmgmtdb to "j:\backups\sybmgmtdb.bak" with compression="4"
go
use sybsystemdb
go
dump database sybsystemdb to "j:\backups\sybsystemdb.bak" with compression="4"
go
use sybsystemprocs
go
dump database sybsystemprocs to "j:\backups\sybsystemprocs.bak" with compression="4"
go

