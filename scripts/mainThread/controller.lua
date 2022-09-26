local mod = {
    loadOrder = 50
}

local spellbind = mjrequire "spellbind/spellbind"

function mod:onload(controller)
    spellbind:load()
end

return mod