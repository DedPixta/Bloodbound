-- A unit last hit a creep, a tower, or a hero
function bloodbound:OnLastHit(keys)
	--DebugPrint("[DEBUG] OnLastHit event")
	--PrintTable(keys)

	local IsFirstBlood = keys.FirstBlood == 1
	local IsHeroKill = keys.HeroKill == 1
	local IsTowerKill = keys.TowerKill == 1

	-- Player ID that got a last hit
	local playerID = keys.PlayerID

	-- Killed unit (creep, hero, tower etc.)
	local killed_entity 
	if keys.EntKilled then
		killed_entity = EntIndexToHScript(keys.EntKilled)
	end
end