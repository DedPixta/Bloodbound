-- An item was picked up off the ground
function bloodbound:OnItemPickedUp(keys)
	DebugPrint("[DEBUG] OnItemPickedUp event")
	--PrintTable(keys)

	-- Find who picked up the item
	local unit_entity
	if keys.UnitEntitIndex then -- keys.UnitEntitIndex may be always nil
		unit_entity = EntIndexToHScript(keys.UnitEntitIndex)
	elseif keys.HeroEntityIndex then
		unit_entity = EntIndexToHScript(keys.HeroEntityIndex)
	end

	local item_entity
	if keys.ItemEntityIndex then
		item_entity = EntIndexToHScript(keys.ItemEntityIndex)
	end
	local playerID = keys.PlayerID
	local item_name = keys.itemname
end
