if WaveSpawner == nil then WaveSpawner = {} end

-- Локальная функция для спавна одного юнита
local function spawnUnit(unitName, spawnPoint, goalEntity)
    local pos = spawnPoint:GetAbsOrigin() + RandomVector(RandomFloat(50, 150))
    local unit = CreateUnitByName(unitName, pos, true, nil, nil, DOTA_TEAM_BADGUYS)
    unit:SetInitialGoalEntity(goalEntity)
end

function WaveSpawner.spawn(wave, config, onComplete)
    -- Создаём очередь типов с оставшимся количеством
    local unitTypes = {}
    for _, unit in ipairs(wave.units) do
        table.insert(unitTypes, { name = unit.name, remaining = unit.count })
    end

    local delay = 0

    -- Пока есть кого спавнить — крутим циклы
    while true do
        local anyLeft = false

        for _, unitType in ipairs(unitTypes) do
            if unitType.remaining > 0 then
                anyLeft = true

                for _, spawnPoint in ipairs(config.spawnPoints) do
                    Timers:CreateTimer(delay, function()
                        spawnUnit(unitType.name, spawnPoint, config.goalEntity)
                    end)
                end

                unitType.remaining = unitType.remaining - 1
                delay = delay + config.delayBetweenUnits
            end
        end

        if not anyLeft then break end
    end

    -- Запускаем колбэк после окончания спавна
    Timers:CreateTimer(delay, function()
        if onComplete then onComplete() end
    end)
end
