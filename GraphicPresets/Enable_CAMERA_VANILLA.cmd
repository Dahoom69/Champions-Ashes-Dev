@ECHO OFF
ECHO.
ECHO	 _    __               _  __ __          ______                                    
ECHO	^| ^|  / /____ _ ____   (_)/ // /____ _   / ____/____ _ ____ ___   ___   _____ ____ _
ECHO	^| ^| / // __ `// __ \ / // // // __ `/  / /    / __ `// __ `__ \ / _ \ / ___// __ `/
ECHO	^| ^|/ // /_/ // / / // // // // /_/ /  / /___ / /_/ // / / / / //  __// /   / /_/ / 
ECHO	^|___/ \__,_//_/ /_//_//_//_/ \__,_/   \____/ \__,_//_/ /_/ /_/ \___//_/    \__,_/                                                                                     
ECHO.
ECHO Unchanged camera movements
ECHO.
ECHO Initiating Preset...
robocopy ".\Vanilla\param\gameparam" "..\_ashes\param\gameparam" "*.parambnd*" /e /z /mir >nul 2>nul
ECHO READY, Enjoy Ashes!
PAUSE