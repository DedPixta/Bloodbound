-- Global Lua Modifiers
if ModifierConfig == nil then
    ModifierConfig = class({})
end

function ModifierConfig.init()
    LinkLuaModifier("modifier_custom_invulnerable", "modifiers/modifier_custom_invulnerable.lua", LUA_MODIFIER_MOTION_NONE)
    LinkLuaModifier("modifier_custom_passive_gold", "modifiers/modifier_custom_passive_gold_example.lua", LUA_MODIFIER_MOTION_NONE)
end
