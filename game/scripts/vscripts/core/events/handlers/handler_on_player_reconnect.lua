-- A player has reconnected to the game. This function can be used to repaint Player-based particles or change state as necessary
function bloodbound:OnPlayerReconnect(keys)
	DebugPrint("[DEBUG] A Player has reconnected.")
	--PrintTable(keys)

	local new_state = GameRules:State_Get()
	if new_state > DOTA_GAMERULES_STATE_HERO_SELECTION then
		local playerID = keys.PlayerID or keys.player_id

		if not playerID or not PlayerResource:IsValidPlayerID(playerID) then
			print("OnPlayerReconnect - Reconnected player ID isn't valid!")
		end

		if PlayerResource:HasSelectedHero(playerID) or PlayerResource:HasRandomed(playerID) then
			-- This playerID already had a hero before disconnect
		else
			-- PlayerResource:IsConnected(playerID) is custom-made; can be found in 'player_resource.lua' library
			if PlayerResource:IsConnected(playerID) and not PlayerResource:IsBroadcaster(playerID) then
				PlayerResource:GetPlayer(playerID):MakeRandomHeroSelection()
				PlayerResource:SetHasRandomed(playerID)
				PlayerResource:SetCanRepick(playerID, false)
				DebugPrint("[DEBUG] OnPlayerReconnect - Randomed a hero for a player ID "..playerID.." that reconnected.")
			end
		end
	end
end
