if PreCacheConfig == nil then
    PreCacheConfig = class({})
end

--[[
This function is used to precache resources/units/items/abilities that will be needed
for sure in your game and that will not be precached by hero selection.  When a hero
is selected from the hero selection screen, the game will precache that hero's assets,
any equipped cosmetics, and perform the data-driven precaching defined in that hero's
precache{} block, as well as the precache{} block for any equipped abilities.

See GameMode:PostLoadPrecache() in gamemode.lua for more information
]]
function PreCacheConfig.preload(context)
    DebugPrint("[DEBUG] Performing pre-load precache")
    print("Performing pre-load precache")

    -- Particles can be precached individually or by folder
    -- It it likely that precaching a single particle system will precache all of its children, but this may not be guaranteed
    PrecacheResource("particle", "particles/econ/generic/generic_aoe_explosion_sphere_1/generic_aoe_explosion_sphere_1.vpcf", context)
    PrecacheResource("particle_folder", "particles/test_particle", context)

    -- Models can also be precached by folder or individually
    -- PrecacheModel should generally used over PrecacheResource for individual models

    --PrecacheResource("model_folder", "particles/heroes/antimage", context)
    --PrecacheResource("model", "particles/heroes/viper/viper.vmdl", context)
    --PrecacheModel("models/heroes/viper/viper.vmdl", context)
    --PrecacheModel("models/props_gameplay/treasure_chest001.vmdl", context)
    --PrecacheModel("models/props_debris/merchant_debris_chest001.vmdl", context)
    --PrecacheModel("models/props_debris/merchant_debris_chest002.vmdl", context)

    -- Sounds can precached here like anything else
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_gyrocopter.vsndevts", context)

    -- Entire items can be precached by name
    -- Abilities can also be precached in this way despite the name
    PrecacheItemByNameSync("example_ability", context)
    PrecacheItemByNameSync("item_example_item", context)

    -- Entire heroes (sound effects/voice/models/particles) can be precached with PrecacheUnitByNameSync
    -- Custom units from npc_units_custom.txt can also have all of their abilities and precache{} blocks precached in this way
    PrecacheUnitByNameSync("npc_dota_hero_ancient_apparition", context)
    PrecacheUnitByNameSync("npc_dota_hero_enigma", context)
end

--[[
  This function should be used to set up Async precache calls at the beginning of the gameplay.

  In this function, place all of your PrecacheItemByNameAsync and PrecacheUnitByNameAsync.  These calls will be made
  after all players have loaded in, but before they have selected their heroes. PrecacheItemByNameAsync can also
  be used to precache dynamically-added datadriven abilities instead of items.  PrecacheUnitByNameAsync will
  precache the precache{} block statement of the unit and all precache{} block statements for every Ability#
  defined on the unit.

  This function should only be called once.  If you want to/need to precache more items/abilities/units at a later
  time, you can call the functions individually (for example if you want to precache units in a new wave of
  holdout).

  This function should generally only be used if the Precache() function in addon_game_mode.lua is not working.
]]
function PreCacheConfig.postLoad(context)
    DebugPrint("[DEBUG] Performing Post-Load precache.")
    --PrecacheItemByNameAsync("item_example_item", function(...) end)
    --PrecacheItemByNameAsync("example_ability", function(...) end)

    --PrecacheUnitByNameAsync("npc_dota_hero_viper", function(...) end)
    --PrecacheUnitByNameAsync("npc_dota_hero_enigma", function(...) end)
end
