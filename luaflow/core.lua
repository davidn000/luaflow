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

]]


local function luaflow_error(err)
    core.request:write( "ERROR:", err )
end



--  Util core --

local function recurrsive_search(tables, str_)
    local table_of_strings = {}
    local str
    for i, q in pairs(tables) do
        str = str_ .. i
        local arr = {}

        local c = type(tables[i]) == "table"
        if c then
            table.insert(arr, i)
            str = recurrsive_search(tables[i], str .. ".")
            if type(str) == "table" then
                for x, v in pairs(str) do
                    local t_Val = nil
                    table.insert(table_of_strings, v)

                    local index = 1
                    for ivs in string.gmatch(v, "[^.]+") do
                        if index > 1 then
                            if t_Val == nil then
                                t_Val = tables[ivs]
                            else
                                t_Val = t_Val[ivs]
                            end

                        end
                        index = index + 1
                    end


                    _G[v] = t_Val
                end
            else
                
            end

        else
            table.insert(table_of_strings, str)
            _G[str] = q
        end
    end
    return table_of_strings

end

local function search_variables(variables)
    local table_of_strings = {}
    for i, q in pairs(variables) do
        local c = type(variables[i]) == "table"

        if c then
            local s = i .. "."
            local x = recurrsive_search(variables[i], s)
            if type(x) == "table" then
                for r, v in pairs(x) do
                    table.insert(table_of_strings, v)
                end
            else
                table.insert(table_of_strings, x)
            end

        else

            table.insert(table_of_strings, i)
            _G[i] = q
        end
    end
    return table_of_strings
end


-- Util core --






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
    local a = search_variables(self.variables)


    for i,v in ipairs(a) do
        
        s = string.gsub(s, string.format("{{%s}}", a[i]), _G[a[i]])

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