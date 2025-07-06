if WaveConfig == nil then
    WaveConfig = {}
end

local function countPlayers()
    local playerCount = 0
    for i = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
        if PlayerResource:IsValidPlayer(i) then
            playerCount = playerCount + 1
        end
    end
    return playerCount
end

function WaveConfig.init()
    return {
        spawnInterval = 20,
        delayBetweenUnits = 0.3,
        sideCount = countPlayers(),
        spawnPoints = {
            Entities:FindByName(nil, "spawn_point_1"),
            Entities:FindByName(nil, "spawn_point_2")
        },
        goalEntity = Entities:FindByName(nil, "goal_entity")
    }
end
