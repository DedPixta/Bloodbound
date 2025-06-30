-- Order Filter; order can be casting an ability, moving, clicking to attack, using scan (radar), glyph etc.
function bloodbound:OrderFilter(filter_table)
	--PrintTable(filter_table)

	local order = filter_table.order_type
	local units = filter_table.units
	local playerID = filter_table.issuer_player_id_const

	-- Order enums:
	-- DOTA_UNIT_ORDER_NONE = 0
	-- DOTA_UNIT_ORDER_MOVE_TO_POSITION = 1
	-- DOTA_UNIT_ORDER_MOVE_TO_TARGET = 2
	-- DOTA_UNIT_ORDER_ATTACK_MOVE = 3
	-- DOTA_UNIT_ORDER_ATTACK_TARGET = 4
	-- DOTA_UNIT_ORDER_CAST_POSITION = 5
	-- DOTA_UNIT_ORDER_CAST_TARGET = 6
	-- DOTA_UNIT_ORDER_CAST_TARGET_TREE = 7
	-- DOTA_UNIT_ORDER_CAST_NO_TARGET = 8
	-- DOTA_UNIT_ORDER_CAST_TOGGLE = 9
	-- DOTA_UNIT_ORDER_HOLD_POSITION = 10
	-- DOTA_UNIT_ORDER_TRAIN_ABILITY = 11
	-- DOTA_UNIT_ORDER_DROP_ITEM = 12
	-- DOTA_UNIT_ORDER_GIVE_ITEM = 13
	-- DOTA_UNIT_ORDER_PICKUP_ITEM = 14
	-- DOTA_UNIT_ORDER_PICKUP_RUNE = 15
	-- DOTA_UNIT_ORDER_PURCHASE_ITEM = 16
	-- DOTA_UNIT_ORDER_SELL_ITEM = 17
	-- DOTA_UNIT_ORDER_DISASSEMBLE_ITEM = 18
	-- DOTA_UNIT_ORDER_MOVE_ITEM = 19
	-- DOTA_UNIT_ORDER_CAST_TOGGLE_AUTO = 20
	-- DOTA_UNIT_ORDER_STOP = 21
	-- DOTA_UNIT_ORDER_TAUNT = 22
	-- DOTA_UNIT_ORDER_BUYBACK = 23
	-- DOTA_UNIT_ORDER_GLYPH = 24
	-- DOTA_UNIT_ORDER_EJECT_ITEM_FROM_STASH = 25
	-- DOTA_UNIT_ORDER_CAST_RUNE = 26
	-- DOTA_UNIT_ORDER_PING_ABILITY = 27
	-- DOTA_UNIT_ORDER_MOVE_TO_DIRECTION = 28
	-- DOTA_UNIT_ORDER_PATROL = 29
	-- DOTA_UNIT_ORDER_VECTOR_TARGET_POSITION = 30
	-- DOTA_UNIT_ORDER_RADAR = 31
	-- DOTA_UNIT_ORDER_SET_ITEM_COMBINE_LOCK = 32
	-- DOTA_UNIT_ORDER_CONTINUE = 33
	-- DOTA_UNIT_ORDER_VECTOR_TARGET_CANCELED = 34
	-- DOTA_UNIT_ORDER_CAST_RIVER_PAINT = 35
	-- DOTA_UNIT_ORDER_PREGAME_ADJUST_ITEM_ASSIGNMENT = 36
	-- DOTA_UNIT_ORDER_DROP_ITEM_AT_FOUNTAIN = 37
	-- DOTA_UNIT_ORDER_TAKE_ITEM_FROM_NEUTRAL_ITEM_STASH = 39

	-- Example 1: If the order is an ability
	if order == DOTA_UNIT_ORDER_CAST_POSITION or order == DOTA_UNIT_ORDER_CAST_TARGET or order == DOTA_UNIT_ORDER_CAST_NO_TARGET or order == DOTA_UNIT_ORDER_CAST_TOGGLE or order == DOTA_UNIT_ORDER_CAST_TOGGLE_AUTO then
		local ability_index = filter_table.entindex_ability
		local ability
		if ability_index then
			ability = EntIndexToHScript(ability_index)
		end
		local caster
		if units and units["0"] then
			caster = EntIndexToHScript(units["0"])
		end
	end

	-- Example 2: If the order is a simple move command
	if order == DOTA_UNIT_ORDER_MOVE_TO_POSITION and units then
		local destination_x = filter_table.position_x
		local destination_y = filter_table.position_y
		local unit_with_order
		if units["0"] then
			unit_with_order = EntIndexToHScript(units["0"])
		end
	end
	
	-- Example 3: Disable item sharing for a custom courier that everyone can control
	--[[
	if order == DOTA_UNIT_ORDER_DROP_ITEM or order == DOTA_UNIT_ORDER_GIVE_ITEM then
		local unit_with_order = EntIndexToHScript(units["0"])
		local ability_index = filter_table.entindex_ability
		local ability = EntIndexToHScript(ability_index)

		if unit_with_order:IsCourier() and ability and ability:IsItem() then
			local purchaser = ability:GetPurchaser()
			if purchaser and purchaser:GetPlayerID() ~= playerID then
				CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(playerID), "display_custom_error", { message = "#hud_error_courier_cant_order_item" })
				return false
			end
		end
	end
	]]

	return true
end
