hook.Add("CanTool", "CFC_GmodScripts_WeaponClipFix", function(_, tr, toolName)
    if toolName == "proper_clipping" and tr.Hit then
        local hitEnt = tr.Entity
        if hitEnt and hitEnt:IsValid() and string.StartWith(hitEnt:GetModel(), "models/weapons") then
            print("[Purple Defender] WeaponClipFix: Blocked proper clipping on weapon model")
            return false
        end
    end
end)
