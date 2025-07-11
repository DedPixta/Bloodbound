-- Gold filter, can be used to modify how much gold player gains/loses
function bloodbound:GoldFilter(keys)
	--PrintTable(keys)

	local gold = keys.gold
	local playerID = keys.player_id_const
	local reason = keys.reason_const
	local reliable = keys.reliable

	-- Reasons:
	-- DOTA_ModifyGold_Unspecified = 0
	-- DOTA_ModifyGold_Death = 1
	-- DOTA_ModifyGold_Buyback = 2
	-- DOTA_ModifyGold_PurchaseConsumable = 3
	-- DOTA_ModifyGold_PurchaseItem = 4
	-- DOTA_ModifyGold_AbandonedRedistribute = 5
	-- DOTA_ModifyGold_SellItem = 6
	-- DOTA_ModifyGold_AbilityCost = 7
	-- DOTA_ModifyGold_CheatCommand = 8
	-- DOTA_ModifyGold_SelectionPenalty = 9
	-- DOTA_ModifyGold_GameTick = 10
	-- DOTA_ModifyGold_Building = 11
	-- DOTA_ModifyGold_HeroKill = 12
	-- DOTA_ModifyGold_CreepKill = 13
	-- DOTA_ModifyGold_NeutralKill = 14
	-- DOTA_ModifyGold_RoshanKill = 15
	-- DOTA_ModifyGold_CourierKill = 16
	-- DOTA_ModifyGold_BountyRune = 17
	-- DOTA_ModifyGold_SharedGold = 18
	-- DOTA_ModifyGold_AbilityGold = 19
	-- DOTA_ModifyGold_WardKill = 20

	-- Disable all hero kill gold
	if DISABLE_ALL_GOLD_FROM_HERO_KILLS then
		if reason == DOTA_ModifyGold_HeroKill then
			return false
		end
	end

	return true
end
