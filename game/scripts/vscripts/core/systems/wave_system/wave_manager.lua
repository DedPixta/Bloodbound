require("core.systems.wave_system.wave_data")
require("core.systems.wave_system.wave_config")
require("core.systems.wave_system.wave_spawner")

if WaveManager == nil then
    WaveManager = class({})
end

function WaveManager:start()
    self.currentWave = 0
    self.config = WaveConfig.init()
    self:startNextWave()
end

function WaveManager:startNextWave()
    self.currentWave = self.currentWave + 1
    local wave = WaveData:getWave(self.currentWave)

    if wave then
        print("[WAVE] Spawning wave #" .. self.currentWave)
        WaveSpawner.spawn(wave, self.config, function()
            self:scheduleNextWave()
        end)
    else
        print("[WAVE] All waves finished.")
    end
end

function WaveManager:scheduleNextWave()
    Timers:CreateTimer(self.config.spawnInterval, function()
        self:startNextWave()
    end)
end
