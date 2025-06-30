-- Bounty Rune Filter, can be used to modify Alchemist's Greevil Greed for example
function bloodbound:BountyRuneFilter(keys)
	--PrintTable(keys)

	local gold_bounty = keys.gold_bounty
	local playerID = keys.player_id_const
	local xp_bounty = keys.xp_bounty		-- value: 0

	return true
end
