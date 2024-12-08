-- Register slash command
SLASH_SWAPTRINKETS1 = "/swaptrinkets"

SlashCmdList["SWAPTRINKETS"] = function()
    -- Check if the player is in combat
    if UnitAffectingCombat("player") then
        DEFAULT_CHAT_FRAME:AddMessage("Cannot swap trinkets while in combat!")
        return
    end

    -- Get current trinket slot items
    local trinket1 = GetInventoryItemID("player", 13) -- Trinket slot 1 (slot ID 13)
    local trinket2 = GetInventoryItemID("player", 14) -- Trinket slot 2 (slot ID 14)

    if not trinket1 or not trinket2 then
        DEFAULT_CHAT_FRAME:AddMessage("One or both trinket slots are empty!")
        return
    end

    -- Swap trinkets
    PickupInventoryItem(13) -- Pick up trinket from slot 1
    EquipCursorItem(14) -- Equip it in slot 2
    DEFAULT_CHAT_FRAME:AddMessage("Swapped trinkets!")
end