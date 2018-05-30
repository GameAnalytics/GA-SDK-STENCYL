REM 
REM WINDOWS Build

del ..\ndll\windows\*.*
mkdir ..\ndll\windows
REM remove Windows Objects
del obj\msvc16xp\*.*
del obj\lib\*.*
REM Stencyl Directory on Windows: c:\abc 
rem haxelib setup c:\abc\lib
set hpath=c:\abc\plaf
set PATH=%PATH%;%hpath%\haxe
set PATH=%PATH%;%hpath%\haxe\lib\lime\lime\templates\neko\ndll\windows
set PATH=%PATH%;%hpath%\neko-win
REM Make the Windows .ndll
set HAXE_PATH=%hpath%\haxe
set HAXEPATH=%HAXE_PATH%
set NEKOPATH=%hpath%\neko-win
haxelib run hxcpp Build.xml 
