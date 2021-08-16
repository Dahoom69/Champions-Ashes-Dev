@ECHO OFF
echo  _    __                    __  __ __  __ ____ 
echo ^| ^|  / /____ _ ____        / / / // / / // __ \
echo ^| ^| / // __ `// __ \      / /_/ // / / // / / /
echo ^| ^|/ // /_/ // / / /_    / __  // /_/ // /_/ / 
echo ^|___/ \__,_//_/ /_/(_)  /_/ /_/ \____//_____/  
echo.
ECHO Vanilla HUD, no changes.
ECHO.
ECHO Initiating Preset...
robocopy ".\Vanilla HUD\menu" "..\..\_ashes\menu" "01_000_fe.gfx" "01_001_fe_soul.gfx" /e >nul 2>nul
robocopy ".\Vanilla HUD\stayparam" "..\..\_ashes\param\stayparam" "stayparam.parambnd.dcx" /e >nul 2>nul
ECHO READY, Enjoy Ashes!
PAUSE