require("core.systems.wave_system.wave_data")

if WaveManager == nil then
    WaveManager = class({})
end

function WaveManager:init(config)
    self.currentWave = 0
    self.spawnPoints = config.spawnPoints
    self.goalEntity = config.goalEntity
    self.spawnInterval = config.spawnInterval or 30
    self.sideCount = config.sideCount or 1
end

function WaveManager:start()
    self:startNextWave()
end

function WaveManager:startNextWave()
    self.currentWave = self.currentWave + 1
    local wave = WaveData:getWave(self.currentWave)

    if wave then
        self:spawnWave(wave)
        self:scheduleNextWave()
    else
        print("[WAVE] All waves finished.")
    end
end

function WaveManager:scheduleNextWave()
    Timers:CreateTimer(self.spawnInterval, function()
        self:startNextWave()
    end)
end

function WaveManager:spawnWave(wave)
    print("[WAVE] Spawning wave #" .. self.currentWave)

    if (#self.spawnPoints == 0) then
        print("[WAVE] No spawn points defined!")
        return
    end

    for _, unit in ipairs(wave.units) do
        for i = 1, unit.count do
            for j = 1, #self.spawnPoints do
                local spawnPoint = self.spawnPoints[j]
                local unitName = unit.name
                if not unitName then
                    print("[WAVE] Unit name is nil for wave #" .. self.currentWave)
                end

                self:spawnUnit(unitName, spawnPoint)
            end
        end
    end
end

function WaveManager:spawnUnit(unitName, spawnPoint)
    local basePos = spawnPoint:GetAbsOrigin()
    local offset = RandomVector(RandomFloat(100, 300))
    local spawnPos = basePos + offset

    local unit = CreateUnitByName(unitName, spawnPos, true, nil, nil, DOTA_TEAM_NEUTRALS)
    FindClearSpaceForUnit(unit, spawnPos, true)

    unit:SetInitialGoalEntity(self.goalEntity)
end
