-- Handle stuff when a player disconnects
function bloodbound:OnDisconnect(keys)
	DebugPrint("[DEBUG] A Player has disconnected")
	--PrintTable(keys)

	local name = keys.name
	local networkID = keys.networkid
	local reason = keys.reason
	local userID = keys.userid
	local playerID = keys.PlayerID
end