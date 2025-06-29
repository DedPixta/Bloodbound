-- A rune was activated by a player
function bloodbound:OnRuneActivated(keys)
	DebugPrint("[BAREBONES] OnRuneActivated event")
	--PrintTable(keys)

  local playerID = keys.PlayerID
  local rune = keys.rune

  -- For Bounty Runes use BountyRuneFilter
  -- For modifying which runes spawn use RuneSpawnFilter (if it works)
  -- This event can be used for adding more effects to existing runes.
end

