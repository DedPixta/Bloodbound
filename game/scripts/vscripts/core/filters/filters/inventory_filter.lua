-- Inventory filter, triggers every time a unit picks up or buys an item, doesn't trigger when you change item's slot inside inventory
function bloodbound:InventoryFilter(keys)
	--PrintTable(keys)

	local unit_with_inventory_index = keys.inventory_parent_entindex_const -- -1 if not defined
	local item_index = keys.item_entindex_const
	local owner_index = keys.item_parent_entindex_const -- -1 if not defined
	local item_slot = keys.suggested_slot -- slot in which the item should be put, usually its -1 meaning put in the first free slot

	-- Item slots:
	-- Inventory slots: DOTA_ITEM_SLOT_1 - DOTA_ITEM_SLOT_9
	-- Backpack slots: DOTA_ITEM_SLOT_7 - DOTA_ITEM_SLOT_9
	-- Stash slots: DOTA_STASH_SLOT_1 - DOTA_STASH_SLOT_6
	-- Teleport scroll slot: DOTA_ITEM_TP_SCROLL = 15
	-- Neutral item slot: DOTA_ITEM_NEUTRAL_SLOT = 16
	-- Other constants:
	-- DOTA_ITEM_INVENTORY_SIZE = 9 (DOTA_ITEM_SLOT_1 = 0; DOTA_ITEM_SLOT_9 = 8)
	-- DOTA_ITEM_STASH_MIN = 9 (same as DOTA_STASH_SLOT_1)
	-- DOTA_ITEM_STASH_MAX = 15
	-- DOTA_ITEM_TRANSIENT_ITEM = 17
	-- DOTA_ITEM_TRANSIENT_RECIPE = 18
	-- DOTA_ITEM_MAX = 19
	-- DOTA_ITEM_TRANSIENT_CAST_ITEM = 20

	local unit_with_inventory
	local unit_name
	if unit_with_inventory_index and unit_with_inventory_index ~= -1 then
		unit_with_inventory = EntIndexToHScript(unit_with_inventory_index)
		unit_name = unit_with_inventory:GetUnitName()
	end

	local item 
	if item_index then
		item = EntIndexToHScript(item_index)
	end
	local item_name
	if item then
		item_name = item:GetName()
	end

	local owner_of_this_item
	if owner_index and owner_index ~= -1 then
		-- not reliable
		owner_of_this_item = EntIndexToHScript(owner_index)
	elseif item then
		owner_of_this_item = item:GetPurchaser()
	end

	local owner_name
	if owner_of_this_item then
		if owner_of_this_item.GetUnitName then
			-- owner is an NPC
			owner_name = owner_of_this_item:GetUnitName()
		elseif owner_of_this_item.IsPlayer and (owner_of_this_item:IsPlayer() or owner_of_this_item:IsPlayerController()) then
			-- owner is a player
			owner_name = owner_of_this_item:GetName() -- not ideal but you get the idea
		end
	end

	return true
end
