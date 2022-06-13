local utils = {}
utils.__index = utils




function utils.get_table_name(table_name) 
    for k, v in pairs(_G) do
        if v == table_name then
            return k
        end
    end
    return nil
end

function utils.print_globals()
    for k, v in pairs(_G) do
        print("k: " .. k)
        print("v: " .. tostring(v))

    end
end



return utils