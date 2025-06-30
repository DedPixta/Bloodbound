-- Healing Filter, can be used to modify how much hp regen and healing a unit is gaining
-- Triggers every time a unit gains health
function bloodbound:HealingFilter(keys)
	--PrintTable(keys)

	local healing_target_index = keys.entindex_target_const
	local heal_amount = keys.heal -- heal amount of the ability or health restored with hp regen during server tick
	local healer_index = keys.entindex_healer_const
	local healing_ability_index = keys.entindex_inflictor_const

	local healing_target
	if healing_target_index then
		healing_target = EntIndexToHScript(healing_target_index)
	end

	-- Find the source of the heal - the healer
	local healer
	if healer_index then
		healer = EntIndexToHScript(healer_index)
	else
		healer = healing_target -- hp regen
	end

	-- Find healing ability
	-- Abilities that give bonus hp regen don't count as healing abilities!!!
	local healing_ability
	if healing_ability_index then
		healing_ability = EntIndexToHScript(healing_ability_index)
	end
	-- If healing_ability is nil then the 'source' of the heal is unit's hp regen

	return true
end
