local mod = {}
local typeMaps = mjrequire "common/typeMaps"
local typeIndexMap = typeMaps.types.skill

function mod:onload(skill)
    local function addSkill(key, info)
        local index = typeIndexMap[key]
        if not index then
            mj:log(
                "ERROR: attempt to add skill type that isn't in typeIndexMap:",
                key)
        else
            if skill.types[key] then
                mj:log("WARNING: overwriting skill type:", key)
            end

            info.key = key
            info.index = index
            skill.types[key] = info
            skill.types[index] = info

            if info.startLearned then
                skill.defaultSkills[index] = true
            end
        end
        return index
    end

    addSkill("wizardry", {
        name = "Wizardry", -- Replace with locale later
        description = "Perform feats of magic to better the tribe",
        icon = "icon_wizard", -- Icon needs implementing
        learnSpeed = 0.5, -- Learn extra slow because magic is hard
    })

    
end

return mod
