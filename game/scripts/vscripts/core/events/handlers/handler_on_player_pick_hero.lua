-- A player picked or randomed a hero, it actually happens on spawn (this is sometimes happening before OnHeroInGame).
function bloodbound:OnPlayerPickHero(keys)
	DebugPrint("[DEBUG] OnPlayerPickHero event")
	--PrintTable(keys)

	local hero_name = keys.hero
	local hero_entity
	if keys.heroindex then
		hero_entity = EntIndexToHScript(keys.heroindex)
	end
	local player
	if keys.player then
		player = EntIndexToHScript(keys.player)
	end

	Timers:CreateTimer(0.5, function()
		if not hero_entity then
			return
		end
		local playerID = hero_entity:GetPlayerID() -- or player:GetPlayerID() if player is not disconnected
		if PlayerResource:IsFakeClient(playerID) then
			-- This is happening only for bots when they spawn for the first time or if they use custom hero-create spells (Custom Illusion spells)
		else
			if not PlayerResource.PlayerData[playerID] and PlayerResource:IsValidPlayerID(playerID) then
				PlayerResource:InitPlayerDataForID(playerID)
			end
			if PlayerResource.PlayerData[playerID].already_assigned_hero == true then
				-- This is happening only when players create new heroes or replacing heroes
				DebugPrint("[DEBUG] OnPlayerPickHero - Player with playerID "..playerID.." got another hero: "..hero_entity:GetUnitName())
			else
				PlayerResource:AssignHero(playerID, hero_entity)
				PlayerResource.PlayerData[playerID].already_assigned_hero = true
			end
		end
	end)
end
