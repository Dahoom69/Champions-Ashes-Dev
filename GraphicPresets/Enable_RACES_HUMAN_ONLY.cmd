@ECHO OFF
ECHO.
ECHO	    __  __                                                      ____             __             __
ECHO	   / / / /  __  __   ____ ___   ____ _   ____    _____         / __ \   ____    / /   __  __   / /
ECHO	  / /_/ /  / / / /  / __ `__ \ / __ `/  / __ \  / ___/        / / / /  / __ \  / /   / / / /  / / 
ECHO	 / __  /  / /_/ /  / / / / / // /_/ /  / / / / (__  )        / /_/ /  / / / / / /   / /_/ /  /_/  
ECHO	/_/ /_/   \__,_/  /_/ /_/ /_/ \__,_/  /_/ /_/ /____/         \____/  /_/ /_/ /_/    \__, /  (_)   
ECHO	                                                                                   /____/                      
ECHO.
ECHO Disables custom race models and reverts to human models
ECHO Recommended if you want to safely reverse hollowing or use Rosaria rebirth
ECHO.
ECHO Initiating Preset...
robocopy ".\Vanilla\parts" "..\_ashes\parts" "*" /e /z >nul 2>nul
ECHO READY, Enjoy Ashes!
PAUSE
