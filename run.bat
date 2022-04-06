@echo off
setlocal enabledelayedexpansion

SET CURRENT_DIR=%~dp0cygwin64\bin
SET SHELLDIR=%CURRENT_DIR%
SET SHELL=%SHELLDIR%\bash.exe
SET BASH=%SHELL%

SET PATH=%SHELLDIR%;%PATH%

cd %SHELLDIR%
::bash.exe ../../run

:path2cygpath
:: Return cygpath var
set var=%~dp0
for %%i in (q w e r t y u i o p a s d f g h j k l z x c v b n m) do (
	if /I "%%i"=="!var:~0,1!" (
		set panfu=%%i
	)
)
set var=%var:~3%
set cygpath=/cygdrive/!panfu!/%var:\=/%

"%SHELL%" %cygpath%/run