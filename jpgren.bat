if %1.==short. goto short
exiftool.exe "-FileName<CreateDate" -d "%%Y-%%m-%%d %%H-%%M-%%S (%%%%f).%%%%e"  %CD%
goto end
:short
exiftool.exe "-FileName<CreateDate" -d "%%Y-%%m-%%d %%H-%%M-%%S.%%%%e"  %CD%
:end