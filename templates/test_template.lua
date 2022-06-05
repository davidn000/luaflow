local template = require("core/template")

local test_template = {}
setmetatable( test_template, { __index = template } )

test_template.variables = {
    firstname="Glawij" -- Overide
}

function test_template:render()
    
    return [[
        <h1>Local variable balance: {{balance}} </h1> 
        <br>
        <h1>Parent variable lastname: {{lastname}} </h1>
        <h1>Parent variable override firstname: {{firstname}} </h1>
    ]]
end


return test_template