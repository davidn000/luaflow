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

function utils.table_dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. utils.table_dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

return utils