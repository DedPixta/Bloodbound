-- A tree was cut down by tango, quelling blade, etc
function bloodbound:OnTreeCut(keys)
	DebugPrint("[DEBUG] OnTreeCut event")
	--PrintTable(keys)

	-- Tree coordinates on the map
	local treeX = keys.tree_x
	local treeY = keys.tree_y
end