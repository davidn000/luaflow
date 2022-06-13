-- App --
local core = require("luaflow/core")
-- App --

-- Templates --
local example = require("templates/example_template")
-- Templates --

local App = {}
setmetatable( App, { __index = core } ) -- setting parent class as core


-- All variables of App --
App.variables = {
    -- Load Templates --
    example = example:build(App.variables), -- You must build and pass variables if you want the template to have access to this view's variables
    -- Load Templates --

    -- Main Variables -- 

    obj_name = "App",
    nest_values = {
        nest1 = "Hello",
        nest2 = "World!"
    }

    -- End Variables --
}

App.head = {
    title = "My Luaflow App",
    stylesheets = {
        "main.css"
    },
    etc = { -- Extra head tags to  add ex. <meta>
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
        <h3>This is: {{obj_name}}</h3>
        
        <h3>{{nest_values.nest1}} {{nest_values.nest2}}</h3>

        <h2>Below is a template:</h2>
        <br>
        {{example}}
    ]]
end

return App