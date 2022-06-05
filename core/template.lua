--[[
    template entry
]]

local core = require("core/core")

local template = {}
template.__index = template

template.variables = {
    
}

template.style = [[
    h1 {
        font-color: green;
    }
]]

-- Main template --


function template:print(data)
    template.request:write(data)
end

function template:render()
    self.request:flush()
    return [[]]
end


function template:build(variables)
    table.insert(self.variables, 1, table.unpack(variables))
    return self:b_render(self:render())
    
end

-- Helpers --



function template:b_render(render_code)

    local s = render_code
    for i,v in pairs(self.variables) do
    
        s = string.gsub(s, string.format("{{%s}}", i), self.variables[i])
    end
    
    return s

end



-- End Helpers --


-- Static Helpers --


--- End Static Helpers --


return template