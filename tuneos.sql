use PRO
go
setuser 'SAPSR3'
go

use master
go

sp_passwordpolicy 'set','disallow simple passwords', '1'
go
sp_passwordpolicy 'set','maximum failed logins', '5'
go
sp_passwordpolicy 'set','min alpha in password', '3'
go
sp_passwordpolicy 'set','min digits in password', '1'
go
sp_passwordpolicy 'set','min lower char in password', '1'
go
sp_passwordpolicy 'set','min upper char in password', '1'
go
sp_passwordpolicy 'set','minimum password length', '8'

go
