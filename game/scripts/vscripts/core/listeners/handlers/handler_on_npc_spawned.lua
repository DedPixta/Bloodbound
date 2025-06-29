-- An NPC has spawned somewhere in game. This includes heroes
function bloodbound:OnNPCSpawned(keys)
	--DebugPrint("[BAREBONES] A unit Spawned")
	--PrintTable(keys)

	local npc = EntIndexToHScript(keys.entindex or 0)
	if not npc then
		print("npc_spawned event doesn't have entindex key")
		return
	end

	local unit_owner = npc:GetOwner()

	-- Put things here that will happen for every unit or hero when they spawn

	-- OnHeroInGame
	if npc:IsRealHero() and not npc.bFirstSpawned then
		npc.bFirstSpawned = true
		bloodbound:OnHeroInGame(npc)
	end
end