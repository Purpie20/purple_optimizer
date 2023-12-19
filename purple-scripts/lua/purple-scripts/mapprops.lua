-- Function to remove entities
local function cleanupEntities()
    -- Entities to be removed
    local entitiesToRemove = {
        "prop_physics*",
        "keyframe_rope",
        "func_lod",
        "func_physbox",
        "func_brush",
        "env_sprite",
        "env_beam",
        "env_laser",
        "env_projectedtexture",
        "env_glow",
        "prop_dynamic*",
        "prop_ragdoll",
        "prop_effect",
        "prop_vehicle*",
        "gmod_light",
        -- Add more entities as needed
    }

    for _, classPattern in pairs(entitiesToRemove) do
        for _, entity in pairs(ents.FindByClass(classPattern)) do
            entity:Remove()
        end
    end

    print("Cleanup script executed successfully!")
end

-- Hook to run the cleanup function when the map finishes loading
hook.Add("InitPostEntity", "MapCleanupScript", function()
    cleanupEntities()
end)
