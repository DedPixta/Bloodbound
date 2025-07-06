if WaveData == nil then
    WaveData = {}
end

WaveData.waves = {
    [1] = {
        units = {
            { count = 10, name = "npc_dota_custom_kobold" },
            { count = 3,  name = "npc_dota_custom_gnoll_assassin" }
        }
    },
    [2] = {
        units = {
            { count = 10, name = "npc_dota_custom_neutral_forest_troll_berserker" },
            { count = 15, name = "npc_dota_custom_neutral_forest_troll_high_priest" }
        }
    },
    [3] = {
        units = {
            { count = 10, name = "npc_dota_custom_neutral_giant_wolf" },
            { count = 5,  name = "npc_dota_custom_neutral_alpha_wolf" }
        }
    },
    [4] = {
        units = {
            { count = 5,  name = "npc_dota_custom_neutral_ogre_magi" },
            { count = 10, name = "npc_dota_custom_neutral_ogre_mauler" }
        }
    },
}

function WaveData:getWave(number)
    return self.waves[number]
end
