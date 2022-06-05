--[[
    core entry
]]

require "string"
local core = {}
core.__index = core
core.request = nil


core.variables = {}
core.variables.__index = core.variables

core.head = {


}

core.style = [[
    h1 {
        font-color: green;
    }
]]








-- Main Core --


function core:print(data)
    core.request:write(data)
end

function core:render()
    self.request:flush()
    return [[]]
end


function core:build()
    
    return self:build_head()
    ..self:b_render(self:render())
    ..self:build_foot()
end

-- Helpers --
function core:build_head()
    local build = "<html>"
    build = build .. "<head>"

    if self.head.title then
        build = build .. "<title>" .. self.head.title .. "</title>"
    end


    if self.head.etc then
        for _,v in pairs(self.head.etc) do
            build = build .. v
        end      
    end

    

    -- Building Styles --

    if self.style then 
        build = build .. "<style type='text/css'>" .. self.style .. "</style>"
    end


    if self.head.stylesheets then
        for _,x in pairs(self.head.stylesheets) do
            build = build.. string.format("<link rel='stylesheet' href='%s'>", x)
        end     
    end

    -- Building Styles End --

    build = build .. "</head>"

    return build

end

function core:build_foot()
    return "</html>"
end

function core:b_render(render_code)

    local s = render_code
    for i,v in pairs(self.variables) do
    
        s = string.gsub(s, string.format("{{%s}}", i), self.variables[i])
    end
    
    return s

end

function core:render_templates()
    local str = ""
    for i,v in pairs(self.variables) do
        if i.render then
            str = str .. i:render()
        end
    end
end


-- End Helpers --


-- Static Helpers --
function core.table_dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. core.table_dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

--- End Static Helpers --


return core