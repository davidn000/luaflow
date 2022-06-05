-- App --
local core = require("core/core")
-- App --

-- Templates --

-- Templates --

local App = {}
setmetatable( App, { __index = core } )



App.variables = {
    x = 1,
    y = 2,
    z = 3
}

App.head = {
    title = "boom title",
    stylesheets = {
        "main.css"
    },
    etc = { -- Extra tags to add, Kinda buggy rn
        ""
    }

}

App.style = [[
    h1 {
        color: green;
    }
]]




--[[

The function below will be called whenever this view is loaded.

--]]

function App:render()  
    return
    [[
        <h1>hello world! this is from a lua script</h1>
    ]]
end

return App