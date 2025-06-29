if FilterConfig == nil then
    FilterConfig = class({})
end

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
    end

    DebugPrint("[DEBUG] All filters registered")
end
