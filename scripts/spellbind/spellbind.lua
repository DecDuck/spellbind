local spellbind = {}

local skillManager = mjrequire "hammerstone/sapien/skill/skillManager"

function spellbind:load()
    local prestidigitationSkillIndex = skillManager:registerSkill({
        -- Id of skill
        id = "prestidigitation",
        -- The name of the skill
        name = "Prestidigitation",
        -- Description
        description = "Performing small-time feats of magic, requring no previous magical experience",
        -- Icon
        icon = "icon_wizard",
        -- Learn data
        learnData = {
            -- Speed modifer for learning
            speed = 1,
            -- Capacity with limited general ability
            -- 0 for all
            -- 1 for partial
            -- 2 for no
            limitedAbility = 1,
            -- Sapiens know it already when they start
            startLearned = false
        },
        -- A list of skill indexes that are required
        dependencies = {}
    })

    local wizardrySkillIndex = skillManager:registerSkill({
        id = "wizardry",
        name = "Wizardry",
        description = "More powerful, but harder magic",
        icon = "icon_wizard",
        learnData = {
            speed = 0.75,
            -- Capacity with limited general ability
            -- 0 for all
            -- 1 for partial
            -- 2 for no
            limitedAbility = 2,
            startLearned = false
        },
        dependencies = {
            prestidigitationSkillIndex -- Require 'Prestidigitation'
        }
    })

    local potionMasterIndex = skillManager:registerSkill({
        id = "potionMaster",
        name = "Potion Brewing",
        description = "Create food items with powerful magical effects",
        icon = "icon_wizard",
        learnData = {
            speed = 0.75,
            -- Capacity with limited general ability
            -- 0 for all
            -- 1 for partial
            -- 2 for no
            limitedAbility = 2,
            startLearned = false
        },
        dependencies = {
            wizardrySkillIndex -- Require 'Wizardry'
        }
    })

    local combatMagicIndex = skillManager:registerSkill({
        id = "combatMagic",
        name = "Combat Magic",
        description = "Utilise magic for combative purposes",
        icon = "icon_wizard",
        learnData = {
            speed = 0.75,
            -- Capacity with limited general ability
            -- 0 for all
            -- 1 for partial
            -- 2 for no
            limitedAbility = 2,
            startLearned = false
        },
        dependencies = {
            wizardrySkillIndex -- Require 'Wizardry'
        }
    })

    local necromancyIndex = skillManager:registerSkill({
        id = "necromancy",
        name = "Necromancy",
        description = "Revive your dead to help you out, without the pesky food cost",
        icon = "icon_wizard",
        learnData = {
            speed = 0.75,
            -- Capacity with limited general ability
            -- 0 for all
            -- 1 for partial
            -- 2 for no
            limitedAbility = 2,
            startLearned = false
        },
        dependencies = {
            wizardrySkillIndex -- Require 'Wizardry'
        }
    })

    local sorcererSupremeIndex = skillManager:registerSkill({
        id = "sorcererSupreme",
        name = "Sorcerer Supreme",
        description = "The most advanced tier of magic",
        icon = "icon_wizard",
        learnData = {
            speed = 0.5,
            -- Capacity with limited general ability
            -- 0 for all
            -- 1 for partial
            -- 2 for no
            limitedAbility = 2,
            startLearned = false
        },
        dependencies = {potionMasterIndex, combatMagicIndex, necromancyIndex}
    })
end

return spellbind
