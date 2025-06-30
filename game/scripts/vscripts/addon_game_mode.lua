-- This is the entry-point to your game mode and should be used primarily to precache models/particles/sounds/etc

-- Creating a global gamemode class variable;
if bloodbound == nil then
	_G.bloodbound = class({})
else
	DebugPrint("[DEBUG] bloodbound class name is already in use, change the name if this is the first time you launch the game!")
	DebugPrint("[DEBUG] If this is not your first time, you probably used script_reload in console.")
end

require('utils.util')
require('libraries/timers')          -- Core lua library
require('libraries/player_resource') -- Core lua library
require('core.bloodbound')             -- main game
require('core.game.precache_config')

function Precache(context)
	PreCacheConfig.preload(context)
end

-- Create the game mode when we activate
function Activate()
	DebugPrint("[DEBUG] Activating ...")
	print("Custom game is activating.")
	bloodbound:InitGameMode()
end
