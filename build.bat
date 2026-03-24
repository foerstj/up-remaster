:: name of map
set map=utraean-peninsula
:: name of map, case-sensitive
set map_cs=Utraean Peninsula

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

:: param
set mode=%1
echo %mode%

:: pre-build checks
setlocal EnableDelayedExpansion
if not "%mode%"=="light" (
  pushd %gaspy%
  set checks=standard
  if "%mode%"=="release" (
    set checks=all
  )
  venv\Scripts\python -m build.pre_build_checks %map% --check !checks! --exclude rivers --bits "%bits%"
  if !errorlevel! neq 0 pause
  popd
)
endlocal

set author=Johannes Förstner
set title=%map_cs%
set copyright=GPG 2002

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
pushd %gaspy%
venv\Scripts\python -m build.fix_start_positions_required_levels %map% --bits "%tmp%\Bits"
if %errorlevel% neq 0 pause
setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  venv\Scripts\python -m build.add_world_levels %map% --bits "%tmp%\Bits" --template-bits "%bits%"
  if !errorlevel! neq 0 pause
)
endlocal
popd
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Maps\%map_cs%.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

set year=2026
set copyright=CC-BY-SA %year%

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\ai\jobs\%map%" "%tmp%\Bits\world\ai\jobs\%map%" /E
robocopy "%bits%\world\contentdb\templates\%map%" "%tmp%\Bits\world\contentdb\templates\%map%" /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%map_cs%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile German language resource file
setlocal EnableDelayedExpansion
if not "%mode%"=="light" (
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\language" "%tmp%\Bits\language" /E
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%map_cs%.de.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
  if !errorlevel! neq 0 pause
)
endlocal

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
