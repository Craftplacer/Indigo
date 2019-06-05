@echo off
cd A:\Data\Desktop\Indigo\
cls
call gradlew build -Ptarget=11.6
pause
copy "A:\Data\Desktop\Indigo\build\11.6\Scratch.swf" "A:\Software\Scratch 2\Scratch.swf" /Y
"A:\Software\Scratch 2\Scratch 2.exe"