if %1.==origin. goto origin
exiftool.exe "-FileName<CreateDate" -d "%%Y-%%m-%%d %%H-%%M-%%S.%%%%e"  %CD%
goto end
:origin
exiftool.exe "-FileName<CreateDate" -d "%%Y-%%m-%%d %%H-%%M-%%S (%%%%f).%%%%e"  %CD%
:end