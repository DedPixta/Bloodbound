-- Modifier (buffs, debuffs) filter function
function bloodbound:ModifierFilter(keys)
	--PrintTable(keys)

	local unit_with_modifier 
	if keys.entindex_parent_const then
		unit_with_modifier = EntIndexToHScript(keys.entindex_parent_const)
	end
	local modifier_name = keys.name_const
	local modifier_duration = keys.duration
	local caster
	if keys.entindex_caster_const then
		caster = EntIndexToHScript(keys.entindex_caster_const)
	end

	return true
end
