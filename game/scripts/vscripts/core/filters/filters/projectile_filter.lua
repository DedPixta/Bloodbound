-- Tracking Projectile (attack and spell projectiles) filter function
function bloodbound:ProjectileFilter(keys)
	--PrintTable(keys)

	local can_be_dodged = keys.dodgeable                   -- values: 1 for yes, 0 for no
	local ability_index = keys.entindex_ability_const      -- value if not ability: -1
	local source_index = keys.entindex_source_const
	local target_index = keys.entindex_target_const
	local expire_time = keys.expire_time
	local is_an_attack_projectile = keys.is_attack         -- values: 1 for yes or 0 for no
	local max_impact_time = keys.max_impact_time
	local projectile_speed = keys.move_speed

	return true
end