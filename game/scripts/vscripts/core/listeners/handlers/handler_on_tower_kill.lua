-- This function is called whenever a tower is destroyed
function bloodbound:OnTowerKill(keys)
	DebugPrint("[BAREBONES] OnTowerKill event")
	--PrintTable(keys)

	local gold = keys.gold
	local killer_userID = keys.killer_userid
	local team = keys.teamnumber
end