-- This file contains all registered events and has already set up the passed-in parameters for you to use.
-- You should comment out or remove the stuff you don't need!

if EventHandler == nil then
    EventHandler = class({})
end

require('core.events.handlers.handler_on_ability_used')
require('core.events.handlers.handler_on_connect_full')
require('core.events.handlers.handler_on_disconnect')
require('core.events.handlers.handler_on_entity_killed')
require('core.events.handlers.handler_on_game_rules_state_change')
require('core.events.handlers.handler_on_hero_in_game')
require('core.events.handlers.handler_on_item_picked_up')
require('core.events.handlers.handler_on_last_hit')
require('core.events.handlers.handler_on_npc_goal_reached')
require('core.events.handlers.handler_on_npc_spawned')
require('core.events.handlers.handler_on_player_chat')
require('core.events.handlers.handler_on_player_learned_ability')
require('core.events.handlers.handler_on_player_level_up')
require('core.events.handlers.handler_on_player_pick_hero')
require('core.events.handlers.handler_on_player_reconnect')
require('core.events.handlers.handler_on_player_selected_custom_team')
require('core.events.handlers.handler_on_rune_activated')
require('core.events.handlers.handler_on_tower_kill')
require('core.events.handlers.handler_on_tree_cut')

local EVENT_HANDLERS = {
    dota_player_used_ability = 'OnAbilityUsed',
    player_connect_full = 'OnConnectFull',
    player_disconnect = 'OnDisconnect',
    entity_killed = 'OnEntityKilled',
    game_rules_state_change = 'OnGameRulesStateChange',
    -- event_name_OnHeroInGame = 'OnHeroInGame',
    dota_item_picked_up = 'OnItemPickedUp',
    last_hit = 'OnLastHit',
    dota_npc_goal_reached = 'OnNPCGoalReached',
    npc_spawned = 'OnNPCSpawned',
    player_chat = 'OnPlayerChat',
    dota_player_learned_ability = 'OnPlayerLearnedAbility',
    dota_player_gained_level = 'OnPlayerLevelUp',
    dota_player_pick_hero = 'OnPlayerPickHero',
    player_reconnected = 'OnPlayerReconnect',
    dota_player_selected_custom_team = 'OnPlayerSelectedCustomTeam',
    -- event_name_OnRuneActivated = 'OnRuneActivated',
    dota_tower_kill = 'OnTowerKill',
    tree_cut = 'OnTreeCut'
}

function EventHandler.init(ctx)
    DebugPrint("[DEBUG] Setting listeners")

    for event, handler in pairs(EVENT_HANDLERS) do
        ListenToGameEvent(event, Dynamic_Wrap(ctx, handler), ctx)
        print("Registered event listener: " .. event .. " -> " .. handler)
    end
    DebugPrint("[DEBUG] All listeners registered")
end
