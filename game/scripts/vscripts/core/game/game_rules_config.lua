if GameRulesConfig == nil then
    GameRulesConfig = class({})
end

function GameRulesConfig:init()
    DebugPrint("[DEBUG] Starting to load Game Rules.")

    -- Setup rules
    GameRules:SetSameHeroSelectionEnabled(ALLOW_SAME_HERO_SELECTION)
    GameRules:SetUseUniversalShopMode(UNIVERSAL_SHOP_MODE)
    GameRules:SetHeroRespawnEnabled(ENABLE_HERO_RESPAWN)

    GameRules:SetHeroSelectionTime(HERO_SELECTION_TIME) -- THIS IS IGNORED when "EnablePickRules" is "1" in 'addoninfo.txt' !
    -- GameRules:SetHeroSelectPenaltyTime(HERO_SELECTION_PENALTY_TIME)

    GameRules:SetPreGameTime(PRE_GAME_TIME)
    GameRules:SetPostGameTime(POST_GAME_TIME)
    GameRules:SetShowcaseTime(SHOWCASE_TIME)
    GameRules:SetStrategyTime(STRATEGY_TIME)

    GameRules:SetTreeRegrowTime(TREE_REGROW_TIME)

    if USE_CUSTOM_HERO_LEVELS then
        GameRules:SetUseCustomHeroXPValues(true)
    end

    --GameRules:SetGoldPerTick(GOLD_PER_TICK) -- Doesn't work; Last time tested: 24.2.2020
    --GameRules:SetGoldTickTime(GOLD_TICK_TIME) -- Doesn't work; Last time tested: 24.2.2020
    GameRules:SetStartingGold(NORMAL_START_GOLD)

    if USE_CUSTOM_HERO_GOLD_BOUNTY then
        GameRules:SetUseBaseGoldBountyOnHeroes(false) -- if true Heroes will use their default base gold bounty which is similar to creep gold bounty, rather than DOTA specific formulas
    end

    GameRules:SetHeroMinimapIconScale(MINIMAP_ICON_SIZE)
    GameRules:SetCreepMinimapIconScale(MINIMAP_CREEP_ICON_SIZE)
    GameRules:SetRuneMinimapIconScale(MINIMAP_RUNE_ICON_SIZE)
    GameRules:SetFirstBloodActive(ENABLE_FIRST_BLOOD)
    GameRules:SetHideKillMessageHeaders(HIDE_KILL_BANNERS)
    GameRules:LockCustomGameSetupTeamAssignment(LOCK_TEAMS)

    -- TO TEST:
    --GameRules:SetAllowOutpostBonuses(true)
    --GameRules:SetEnableAlternateHeroGrids(false) -- disable alternate hero grids to be used (DOTA+, etc) useful when you have custom heroes
    --GameRules:SetSuggestItemsEnabled(false)
    -- HERO BLACK LIST
    --GameRules:SetHideBlacklistedHeroes(true) -- true is hidden, false is dimmed during hero selection
    --GameRules:AddHeroIDToBlacklist(int)
    --GameRules:AddHeroToBlacklist(string)
    --GameRules:ClearHeroBlacklist()
    --GameRules:RemoveHeroFromBlacklist(string)
    --GameRules:RemoveHeroIDFromBlacklist(int)
    -- ITEM WHITE LIST
    --GameRules:SetWhiteListEnabled(true)
    --GameRules:AddItemToWhiteList(string)
    --GameRules:IsItemInWhiteList(string)
    --GameRules:RemoveItemFromWhiteList(string)

    -- This is multi-team configuration stuff
    if USE_AUTOMATIC_PLAYERS_PER_TEAM then
        local num = math.floor(10 / MAX_NUMBER_OF_TEAMS)
        local count = 0
        for team, number in pairs(TEAM_COLORS) do
            if count >= MAX_NUMBER_OF_TEAMS then
                GameRules:SetCustomGameTeamMaxPlayers(team, 0)
            else
                GameRules:SetCustomGameTeamMaxPlayers(team, num)
            end
            count = count + 1
        end
    else
        local count = 0
        for team, number in pairs(CUSTOM_TEAM_PLAYER_COUNT) do
            if count >= MAX_NUMBER_OF_TEAMS then
                GameRules:SetCustomGameTeamMaxPlayers(team, 0)
            else
                GameRules:SetCustomGameTeamMaxPlayers(team, number)
            end
            count = count + 1
        end
    end

    if USE_CUSTOM_TEAM_COLORS then
        for team, color in pairs(TEAM_COLORS) do
            SetTeamCustomHealthbarColor(team, color[1], color[2], color[3])
        end
    end

    DebugPrint("[DEBUG] Done with setting Game Rules.")
end
