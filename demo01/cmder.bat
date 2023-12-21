set appFolder=%~dp0
set args=-Xms256m -Xmx256m -Dfile.encoding=UTF-8
set jarRunner= java

cd %appFolder%
%~d0

for /f "delims=" %%a in ('dir /b/a-d/oD *.jar') do set app=%%a

:SET_BOOT_VARS
if exist var.properties (
	for /f "delims== tokens=1,2" %%G in (var.properties) do set %%G=%%H
)

%jarRunner% %args% -jar %app%
REM @ECHO ON