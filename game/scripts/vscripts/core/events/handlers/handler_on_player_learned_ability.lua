-- Note: IT DOESN'T TRIGGER WHEN YOU USE SetLevel() ON THE ABILITY!
function bloodbound:OnPlayerLearnedAbility(keys)
	DebugPrint("[DEBUG] OnPlayerLearnedAbility event")
	--PrintTable(keys)

	local player
	if keys.player then
		player = EntIndexToHScript(keys.player)
	end

	local ability_name = keys.abilityname

	local playerID
	if player then
		playerID = player:GetPlayerID()
	else
		playerID = keys.PlayerID
	end

	-- PlayerResource:GetBarebonesAssignedHero(index) is custom-made; can be found in 'player_resource.lua' library
	-- This could return a wrong hero if you change your hero often during gameplay
	local hero = PlayerResource:GetBarebonesAssignedHero(playerID)
end
