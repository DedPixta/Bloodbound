require('core.events.event_handler')
require('core.game.game_rules_config')
require('core.game.game_mode_config')
require('modifiers.config.modifier_config')
require('core.filters.filter_config')
require('utils.custom_random')
require('components.component_loader')
require('settings.game_settings')
require("core.systems.wave_system.wave_manager")

--[[
  This function is called once and only once after all players have loaded into the game, right as the hero selection time begins.
  It can be used to initialize non-hero player state or adjust the hero selection (i.e. force random etc)
]]
function bloodbound:OnAllPlayersLoaded()
	DebugPrint("[DEBUG] All Players have loaded into the game.")
end

--[[
  This function is called once and only once when the game completely begins (about 0:00 on the clock).  At this point,
  gold will begin to go up in ticks if configured, creeps will spawn, towers will become damageable etc.  This function
  is useful for starting any game logic timers/thinkers, beginning the first round, etc.
]]
function bloodbound:OnGameInProgress()
	DebugPrint("[DEBUG] The game has officially begun.")

	-- If the day/night is not changed at 00:00, the following line is needed:
	GameRules:SetTimeOfDay(0.251)

	-- Список точек спавна
	local spawns = {
		Entities:FindByName(nil, "spawn_point_1"),
		Entities:FindByName(nil, "spawn_point_2")
	}

	local goal = Entities:FindByName(nil, "goal_entity")

	WaveManager:init({
		spawnPoints = spawns,
		goalEntity = goal,
		spawnInterval = 20, -- интервал между волнами
		sideCount = 2 -- по скольким точкам спавнить
	})

	WaveManager:start()
end

-- This function initializes the game mode and is called before anyone loads into the game
-- It can be used to pre-initialize any values/tables that will be needed later
function bloodbound:InitGameMode()
	CustomRandom.generateSeed()

	ModifierConfig.init()
	GameRulesConfig.init()
	GameModeConfig.init()
	ComponentLoader.init()

	FilterConfig.init(self)
	EventHandler.init(self)

	print("[DEBUG] initialized.")
	DebugPrint("[DEBUG] Done loading the game mode!\n\n")

	-- Increase/decrease maximum item limit per hero
	Convars:SetInt('dota_max_physical_items_purchase_limit', 64)
end
