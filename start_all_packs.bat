@echo off
set appFolder=%~dp0
%~d0

set PATH=%appFolder%.\cmder;%PATH%

for /f "delims=" %%i in (packs.txt) do (
    cd %appFolder%.\%%i
    start ConEmu.exe -reuse -run ".\cmder.bat"  -new_console:t:"%%i"
    echo Starting: "%%i"
    @ping -n 20 127.0.0.1 >nul
)

