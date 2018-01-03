use master
go

--disk resize name = "PRO_data_001", size="80G"
--go

alter database PRO on PRO_data_001="80G"
go
