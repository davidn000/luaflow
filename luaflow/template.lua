--[[
    template entry
]]

local core = require("luaflow/core")

local template = {}
template.__index = template

template.variables = {
    
}

template.style = [[
    h1 {
        font-color: green;
    }
]]





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
    local a = search_variables(self.variables)


    for i,v in ipairs(a) do
        
        s = string.gsub(s, string.format("{{%s}}", a[i]), _G[a[i]])

    end
    
    return s

end



-- End Helpers --


-- Static Helpers --


--- End Static Helpers --


return template