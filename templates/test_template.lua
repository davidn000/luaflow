local template = require("luaflow/template")

local test_template = {}
setmetatable( test_template, { __index = template } )

test_template.variables = {
    firstname="Glawij" -- Overide
}

function test_template:render()
    
    return [[
        <h1>Parent variable fisrt name: {{t.mnb.blah}} </h1>
        <h1>Parent variable override firstname: {{firstname}} </h1>
    ]]
end


return test_template