-- App --
local core = require("luaflow/core")
-- App --

-- Templates --
local test_Template = require("templates/test_template")
-- Templates --

local App = {}
setmetatable( App, { __index = core } )



App.variables = {
    test = test_Template:build(App.variables),

    x = {
        name="object",
        val = {
            nested = "true"
        }
    },
    y = 2,
    z = 3,

    -- pass to templates --
    t = {
        mnb = {
            blah = "none"
        },
        first_name = "Davood",
        last_name = "Najafi"
    }
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
        {{t.mnb.blah}}
    ]]
end

return App