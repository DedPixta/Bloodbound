-- An ability was used by a player; Doesn't trigger on disconnected players.
function bloodbound:OnAbilityUsed(keys)
	--PrintTable(keys)

	local playerID = keys.PlayerID
	local ability_name = keys.abilityname

	-- If you need to adjust abilities before or during their cast, use Order Filter or modifier events, not this
end
