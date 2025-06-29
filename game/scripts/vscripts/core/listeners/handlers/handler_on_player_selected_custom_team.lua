-- This function is called whenever a player changes their custom team selection during Custom Game Setup 
function bloodbound:OnPlayerSelectedCustomTeam(keys)
	DebugPrint("[BAREBONES] OnPlayerSelectedCustomTeam event")
	--PrintTable(keys)

	local playerID = keys.player_id
	local success = keys.success == 1
	local team = keys.team_id
end
