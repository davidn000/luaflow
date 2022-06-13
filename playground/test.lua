local inspect = require('inspect')



gvariables = {
    x = "x val",
    y = "y val",
    z = {
        name = "depth",
        variable = {
            variable_x = "This is nested",
            variable_y = {
                double_nested = "wow",
                tripple_nested = {
                    this_is = "WTF"
                }
            }
        },
        extra = "some extra"

    },
    w = {
        name = "time",
        variable = {
            variable_x = "This is nested x2"
        }
    }

}



local function recurrsive_search(tables, str_)
    local table_of_strings = {}
    local str
    for i, q in pairs(tables) do
        str = str_ .. i
        local arr = {}

        local c = type(tables[i]) == "table"
        if c then
            table.insert(arr,i)
            str = recurrsive_search(tables[i], str .. ".")
            if type(str) == "table" then
                for x, v in pairs(str) do
                    local t_Val = nil
                    table.insert(table_of_strings, v)

                    local index = 1
                    for ivs in string.gmatch(v, "[^.]+") do
                      if index>1 then
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

local function get_table_name(tbl)
    for k, v in pairs(_G) do
        if v == tbl then
            return k
        end
    end
    return nil
end

local function print_globals()
    for k, v in pairs(_G) do
        print("k: " .. k)
        print("v: " .. tostring(v))

    end
end

function Main()

    local list_of_variable_strings = search_variables(gvariables)
    --print(inspect(a))
    --print(inspect(table_of_strings))
    for i,v  in ipairs(list_of_variable_strings) do
        print(list_of_variable_strings[i])
        print(inspect(_G[list_of_variable_strings[i]]))
    end
    --print(a[5])
    --print(inspect(_G[a[5]]))

end

Main()
