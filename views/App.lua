-- App --
local core = require("core/core")
-- App --

-- Templates --

-- Templates --

local App = {}
setmetatable( App, { __index = core } )

-- Will load templates in order
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