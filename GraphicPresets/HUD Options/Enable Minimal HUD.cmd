@ECHO OFF
echo     __  ____            __  ____  ______ 
echo    /  ^|/  (_)___       / / / / / / / __ \
echo   / /^|_/ / / __ \     / /_/ / / / / / / /
echo  / /  / / / / / /    / __  / /_/ / /_/ / 
echo /_/  /_/_/_/ /_(_)  /_/ /_/\____/_____/  
echo.
ECHO A simpler, cleaner HUD!
ECHO.
ECHO Initiating Preset...
robocopy ".\Minimal HUD\menu" "..\..\_ashes\menu" "01_000_fe.gfx" "01_001_fe_soul.gfx" /e >nul 2>nul
robocopy ".\Minimal HUD\stayparam" "..\..\_ashes\param\stayparam" "stayparam.parambnd.dcx" /e >nul 2>nul
ECHO READY, Enjoy Ashes!
PAUSE