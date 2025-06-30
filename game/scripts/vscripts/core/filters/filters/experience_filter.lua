-- Experience filter function
function bloodbound:ExperienceFilter(keys)
	--PrintTable(keys)
	local experience = keys.experience
	local playerID = keys.player_id_const
	local reason = keys.reason_const

	-- Reasons:
	-- DOTA_ModifyXP_Unspecified = 0
	-- DOTA_ModifyXP_HeroKill = 1
	-- DOTA_ModifyXP_CreepKill = 2
	-- DOTA_ModifyXP_RoshanKill = 3
	-- DOTA_ModifyXP_TomeOfKnowledge = 4
	-- DOTA_ModifyXP_Outpost = 5
	-- DOTA_ModifyXP_MAX = 6

	return true
end
