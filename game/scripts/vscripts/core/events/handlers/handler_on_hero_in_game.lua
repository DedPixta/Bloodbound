--[[
  Hero spawned for the first time. It can happen if the player's hero is replaced with a new hero for any reason.  
  This can be used for initializing heroes, such as adding levels, changing the starting gold, removing/adding abilities, adding physics, etc.
  This happens to bot and custom created heroes as well.
  The hero parameter is the hero entity that just spawned.
  
]]
function bloodbound:OnHeroInGame(hero)
	-- Innate abilities like Earth Spirit Stone Remnant (abilities that a hero needs to have auto-leveled up at the start of the game)
	-- Take a look at this guide: https://moddota.com/abilities/creating-innate-abilities
	local innate_abilities = {
		"innate_ability1",
		"innate_ability2"
	}

	-- Cycle through any innate abilities found, then set their level to 1
	for i = 1, #innate_abilities do
		local current_ability = hero:FindAbilityByName(innate_abilities[i])
		if current_ability then
			current_ability:SetLevel(1)
		end
	end

	Timers:CreateTimer(0.5, function()
		local playerID = hero:GetPlayerID()	-- never nil (-1 by default), needs delay 1 or more frames

		if PlayerResource:IsFakeClient(playerID) then
			-- This is happening only for bots
			DebugPrint("[DEBUG] OnHeroInGame - Bot hero "..hero:GetUnitName().." (re)spawned in the game.")
			-- Set starting gold for bots
			hero:SetGold(NORMAL_START_GOLD, false)
		else
			DebugPrint("[DEBUG] OnHeroInGame running for a non-bot player!")
			if not PlayerResource.PlayerData[playerID] and PlayerResource:IsValidPlayerID(playerID) then
				PlayerResource:InitPlayerDataForID(playerID)
			end
			if hero:IsClone() then
				DebugPrint("[DEBUG] OnHeroInGame - Spawned hero is a Meepo Clone")
				return
			elseif hero:IsTempestDouble() then
				DebugPrint("[DEBUG] OnHeroInGame - Spawned hero is a Tempest Double")
				return
			elseif IsMonkeyKingCloneCustom(hero) then
				DebugPrint("[DEBUG] OnHeroInGame - Spawned hero is a Monkey King soldier or invalid entity")
				return
			elseif hero:IsSpiritBearCustom() then
				DebugPrint("[DEBUG] OnHeroInGame - Spawned hero is a Spirit Bear")
				return
			end
			-- Set some hero stuff on first spawn or on every spawn (custom or not)
			if PlayerResource.PlayerData[playerID].already_set_hero == true then
				-- This is happening only when players create new heroes or replace them
			else
				-- This is happening for players when their primary hero spawns for the first time
				DebugPrint("[DEBUG] OnHeroInGame - Hero "..hero:GetUnitName().." spawned in the game for the first time for the player with ID: "..playerID)

				-- Make heroes briefly visible on spawn (to prevent bad fog of war interactions)
				hero:MakeVisibleToTeam(DOTA_TEAM_GOODGUYS, 0.5)
				hero:MakeVisibleToTeam(DOTA_TEAM_BADGUYS, 0.5)

				-- Set the starting gold for the player's hero 
				-- Use 'PlayerResource:ModifyGold(playerID, NORMAL_START_GOLD-600, false, 0)' if GameRules:SetStartingGold breaks again
				-- If the NORMAL_START_GOLD is less than 600, disable Strategy Time and use 'hero:SetGold(NORMAL_START_GOLD, false)' instead
				-- Why? Because OnHeroInGame is triggering during PreGame (after Strategy Time) and players can buy items during Strategy Time (starting gold will remain default 600)
				
				if ADDITIONAL_GPM then
					hero:AddNewModifier(hero, nil, "modifier_custom_passive_gold", {})
				end

				-- Create an item and add it to the player's hero, effectively ensuring they start with the item
				if ADD_ITEM_TO_HERO_ON_SPAWN then
					local item = CreateItem("item_example_item", hero, hero)
					hero:AddItem(item)
				end

				-- Make sure that stuff above will not happen again for the player if some other hero spawns
				-- for him for the first time during the game 
				PlayerResource.PlayerData[playerID].already_set_hero = true
				DebugPrint("[DEBUG] OnHeroInGame - Hero "..hero:GetUnitName().." set for the player with ID: "..playerID)
			end
		end
	end)
end

