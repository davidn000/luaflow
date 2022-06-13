local template = require("luaflow/template")

local example_template = {}
setmetatable( example_template, { __index = template } )

example_template.variables = {
    some_var="some val"
}

function example_template:render()
    --This function gets called whenever the template is rendered
    return [[
        <h1>This is from test template</h1>
        
    ]]
end


return example_template