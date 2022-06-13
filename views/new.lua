local core = require ("luaflow/core")

local new = {}
setmetatable( new, { __index = core } )

new.vairbles = {}

new.head = {
    title = "Hello!",
    stylesheets = {}    
}

function new:render()
    return [[

    ]]
end


return new