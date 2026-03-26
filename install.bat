@echo off
title Slay the Spire 2 - QoL Mods Installer
echo ============================================
echo   Slay the Spire 2 - QoL Mods Installer
echo ============================================
echo.

:: Find Steam path (common locations)
set STEAM_PATH=
if exist "C:\Program Files (x86)\Steam\steamapps\common\Slay the Spire 2" (
    set STEAM_PATH=C:\Program Files (x86)\Steam\steamapps\common\Slay the Spire 2
)
if exist "C:\Program Files\Steam\steamapps\common\Slay the Spire 2" (
    set STEAM_PATH=C:\Program Files\Steam\steamapps\common\Slay the Spire 2
)
if exist "%PROGRAMFILES%\Steam\steamapps\common\Slay the Spire 2" (
    set STEAM_PATH=%PROGRAMFILES%\Steam\steamapps\common\Slay the Spire 2
)

if "%STEAM_PATH%"=="" (
    echo [ERROR] Could not find Slay the Spire 2 installation.
    echo Please enter the game folder path manually:
    set /p GAME_PATH="Path: "
) else (
    set GAME_PATH=%STEAM_PATH%
    echo Found game at: %GAME_PATH%
)

echo.
echo Installing BepInEx and mods...
cd /d "%GAME_PATH%"

:: Download BepInEx if not present
if not exist "BepInEx\core" (
    echo Downloading BepInEx...
    powershell -Command "Invoke-WebRequest -Uri '' -OutFile 'BepInEx.zip'"
    tar -xf BepInEx.zip
    del BepInEx.zip
    echo BepInEx installed.
)

:: Copy plugins
echo Installing QoL plugins...
if not exist "BepInEx\plugins" mkdir "BepInEx\plugins"
xcopy "%~dp0plugins\*" "BepInEx\plugins\" /E /I /Y

echo.
echo ============================================
echo [SUCCESS] Installation complete!
echo Launch Slay the Spire 2 - mods are active.
echo ============================================
pause