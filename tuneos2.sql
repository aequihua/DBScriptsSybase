use PRO
go
setuser 'SAPSR3'
go

use master
go
exec sp_dboption PRO, 'enforce dump tran sequence', true
exec sp_dboption PRO, 'trunc log on chkpt', false
go
