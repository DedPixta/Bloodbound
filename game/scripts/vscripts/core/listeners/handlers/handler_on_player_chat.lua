-- This function is called whenever any player sends a chat message to team or to All
function bloodbound:OnPlayerChat(keys)
	DebugPrint("[BAREBONES] A Player has used the chat")
	--PrintTable(keys)

	local team_only = keys.teamonly == 1
	local userID = keys.userid
	local playerID = keys.playerid
	local text = keys.text
end
