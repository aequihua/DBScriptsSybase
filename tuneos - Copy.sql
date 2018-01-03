use PRO
go
setuser 'SAPSR3'
go
sp_chgattribute "VBHDR", 'concurrency_opt_threshold', -1
go
sp_chgattribute "VBMOD", 'concurrency_opt_threshold', -1
go
sp_chgattribute "VBDATA", 'concurrency_opt_threshold', -1
go
sp_chgattribute "QREFTID", 'concurrency_opt_threshold', -1
go
sp_chgattribute "TRFCQIN", 'concurrency_opt_threshold', -1
go
sp_chgattribute "TRFCQINS", 'concurrency_opt_threshold', -1
go
sp_chgattribute "ARFCSDATA", 'concurrency_opt_threshold', -1
go
sp_chgattribute "TRFCQDATA", 'concurrency_opt_threshold', -1
go
sp_chgattribute "ARFCRSTATE", 'concurrency_opt_threshold', -1
go
sp_chgattribute "ARFCSSTATE", 'concurrency_opt_threshold', -1
go
sp_chgattribute "TRFCQSTATE", 'concurrency_opt_threshold', -1
go
sp_chgattribute "RSBATCHCTRL", 'concurrency_opt_threshold', -1
go

use master
go 

sp_configure "number of locks", 2000000
exec sp_cacheconfig 'default data cache', '40G' 
exec sp_cacheconfig 'default data cache', 'cache_partition=16
exec sp_configure 'global async prefetch limit', 10 

exec sp_configure 'maximum job output', 16777216
exec sp_configure 'stack guard size', 16384
exec sp_configure 'wait on uncommitted insert', 1
exec sp_configure 'lock hashtable size', 81920
exec sp_configure 'number of histogram steps', 100


use master
go
exec sp_dboption PSC, 'enforce dump tran sequence', true
exec sp_dboption PSC, 'trunc log on chkpt', false
go

use master
go

-- limit parallel degree for plan hints (as BW uses them) to 6 
exec sp_configure 'max query parallel degree', 6 
go 
-- limit parallel degree for hash-based parallel queries to 4 and 
-- limit hash-based parallel scans to tables above ~155MB in size 
exec sp_configure 'max scan parallel degree', 4 
exec sp_configure 'min pages for parallel scan', 60000 
go 
-- tell ASE to compile serial plan, and make parallel decision and degree at 
-- execution time – this gives faster plan compilation times and more robust 
-- plan choice exec 
sp_configure 'enable deferred parallel', 1 
go 
-- limit parallel degree of maintenance activities to 10 
exec sp_configure 'max utility parallel degree', 10
go 
-- resize the worker process pool to support about 2-3 maintenance activities 
-- plus a reasonable amount of parallel queries 
exec sp_configure 'number of worker processes', 80 
go 
-- set max parallel degree to max of scan and utility parallel degree 
exec sp_configure 'max parallel degree', 10
go
