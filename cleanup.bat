:: name of map, case-sensitive
set map_cs=Utraean Peninsula
:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\Resources\%map_cs%.dsres"
:: map
del "%ds%\Maps\%map_cs%.dsmap"
