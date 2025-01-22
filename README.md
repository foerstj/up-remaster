# UP remaster

The original Utraean Peninsula map, remastered.

## What I did

This map is re-buildable and editable. I opened & saved every region in Siege Editor v1.7. The dsmap file can be rebuilt using the batch scripts, provided you have the folder structure of Dungeon Siege, TankCreator and gaspy.
- Converted the map to use node mesh index
- Some regions had hotpoints unsupported by SE. All north vectors were fixed.
- SE saves the "required_level" attributes for multiplayer start positions with an "i" in front, which however breaks the level requirement.\
  This is fixed during build by a gaspy script.
- Renamed the map so there are no conflicts with the original map.\
  The internal name is *world/maps/utraean-peninsula*.\
  The generated file name is *Dungeon Siege/Maps/Utraean Peninsula.dsmap*.\
  The ingame name is *Utraean Peninsula (remastered)*.
- Most importantly, the veteran & elite world levels are auto-generated. Siege Editor cannot handle them and deletes them when opening & saving a region anyway.\
  The original world levels were created with a script as well, but details were hand-edited, sometimes rather inconsistently. Generating everything automatically therefore created lots of minor differences to the original world levels. Some of these differences are functional changes, but they're so small they'll hardly be noticed.

## What I did (revisit)

The "revisited" map variant is based on the remaster, with these additional changes:
- Renamed map ingame to *Utraean Peninsula (revisited)*
- Fixed a tree and a barrel floating in mid-air, add a missing sign post, put mugs on tables in Elddim tavern
- Brushed up plants that had default scaling / orientation
- Removed cam-blocking on some terrain nodes like rope bridges for smoother camera movement
- Fixed a few terrain texture borders (i.e. Eastern Island cave, Mausoleum entrance, Elddim exit)
- Polished mood & PWL switches at Pit of Despair entrance & exit
- Fixed fading bugs that resulted in invisible Mausoleum or Mesa Desert
- Added missing PWL switch when coming up Loola's Lift
- Fixed North vector in the Goblin Warrens
- Cleaned up unused references to non-existent conversations & quests
- Fixed shop doors in Meren that you could walk through

## What I did (single-player)

The "single-player" map variant is based on the revisit, with these additional changes:
- Made all player-world-location triggers multi-player-only
- Added Fury Eye
- Enabled map for single-player
- Renamed map ingame to *Utraean Peninsula (single-player)*, adapt description
- Made mules sellable, add mule merchants
- Added companions! They're based on KoE originals, but renamed, conversations adapted etc.

## How to build

GasPy repo: https://github.com/foerstj/gaspy

- Put TankCreator and gaspy on the same folder level as your Dungeon Siege installation. Basically in the upper folder, you should have a "Dungeon Siege" folder, a "TankCreator" folder, and a "gaspy" folder.
- Put this repo as "Bits" into your personal Dungeon Siege LoA folder (where the savegames & screenshots are).
- Go into your Dungeon Siege installation folder and open CMD there.
- %USERPROFILE%\Documents\Dungeon Siege LoA\Bits\build.bat

## Attribution

This map was created by Gas-Powered Games, not me. I'm just doing minor changes here.
