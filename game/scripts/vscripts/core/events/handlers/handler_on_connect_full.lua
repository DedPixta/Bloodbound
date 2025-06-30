-- This function is called once when the player fully connects and becomes "Ready" during Loading
function bloodbound:OnConnectFull(keys)
	DebugPrint("[DEBUG] A Player fully connected.")
	--PrintTable(keys)

	-- PlayerResource:OnPlayerConnect(event) is custom-made; can be found in 'player_resource.lua' library
	PlayerResource:OnPlayerConnect(keys)
end
