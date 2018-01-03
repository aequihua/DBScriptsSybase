@echo off

if "%1"=="" goto error

:procesa
echo -----------
echo PROCESAR ARCHIVO K:\BACKUPS\%1
echo -----------
echo use master > loadlog.sql
echo go >> loadlog.sql
echo load transaction PRO from "j:\backups\%1" >> loadlog.sql
echo go >> loadlog.sql 

echo isql -SPRO -Usapsa -i loadlog.sql -X -PDim3xS4P
isql -SPRO -DPRO -Usapsa -i loadlog.sql -X -PDim3xS4P
pause
move k:\backups\%1 k:\procesados
goto fin 

:error
echo Uso correcto es cargalog <archivo>

:fin
