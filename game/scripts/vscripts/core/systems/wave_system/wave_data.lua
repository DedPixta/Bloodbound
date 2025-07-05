if WaveData == nil then
    WaveData = {}
end

WaveData.waves = {
    [1] = {
        units = {
            { count = 10, name = "npc_dota_custom_kobold" },
            { count = 5, name = "npc_dota_custom_gnoll_assassin" }
        }
    },
    [2] = {
        units = {
            { count = 6, name = "npc_dota_custom_neutral_forest_troll_berserker" },
            { count = 4, name = "npc_dota_custom_neutral_forest_troll_high_priest" }
        }
    }
}

function WaveData:getWave(number)
    return self.waves[number]
end
