@ECHO OFF
ECHO.
ECHO.
ECHO Disables custom race models and reverts to human models
ECHO Recommended if you want to safely reverse hollowing or use Rosaria’s rebirth
ECHO.
ECHO Initiating Preset...
robocopy ".\Vanilla\parts" "..\_ashes\parts" "*" /e /z >nul 2>nul
ECHO READY, Enjoy Ashes!
PAUSE
