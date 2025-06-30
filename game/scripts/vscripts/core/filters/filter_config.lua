if FilterConfig == nil then
    FilterConfig = class({})
end

require('core.filters.filters.bounty_rune_filter')
require('core.filters.filters.damage_filter')
require('core.filters.filters.experience_filter')
require('core.filters.filters.gold_filter')
require('core.filters.filters.healing_filter')
require('core.filters.filters.inventory_filter')
require('core.filters.filters.modifier_filter')
require('core.filters.filters.order_filter')
require('core.filters.filters.projectile_filter')

local FILTERS = {
    SetExecuteOrderFilter       = "OrderFilter",
    SetDamageFilter             = "DamageFilter",
    SetModifierGainedFilter     = "ModifierFilter",
    SetModifyExperienceFilter   = "ExperienceFilter",
    SetTrackingProjectileFilter = "ProjectileFilter",
    SetBountyRunePickupFilter   = "BountyRuneFilter",
    SetHealingFilter            = "HealingFilter",
    SetModifyGoldFilter         = "GoldFilter"
}

function FilterConfig.init(ctx)
    DebugPrint("[DEBUG] Setting Filters")

    local gamemode = GameRules:GetGameModeEntity()

    for setter, handler in pairs(FILTERS) do
        gamemode[setter](gamemode, Dynamic_Wrap(ctx, handler), ctx)
        print("Registered filter: " .. setter .. " -> " .. handler)
    end

    DebugPrint("[DEBUG] All filters registered")
end
