package.path = package.path .. ';C:/xampp/htdocs/luaflow/?.lua' -- change C:/xampp/htdocs/luaflow to the root directory. 
--(Parent of views, templates, and luaflow folder)


-- Luaflow --
local config = require("luaflow/config")
local core = require("luaflow/core")
-- Luaflow --


-- This handle request is processed by apache2's module modlua --
function handle(r)
   
    r:flush() -- clear buffer
    r.content_type = "text/html"
    core.request = r
    if r.method == 'GET' then
        local get_var = r:parseargs()
        
        
        local file = config.src_directory .. config.views_directory  .. get_var["lua_webpage_page_request_variable"]

        if next(config.routes) == nil then
            r:write(dofile(file .. ".lua"):build())
        else
            
            for i,v in pairs(config.routes) do
                
                if i == "/" and get_var["lua_webpage_page_request_variable"] == "App" then
                    r:write(dofile(config.src_directory .. config.views_directory  .. v .. ".lua"):build())
                else
                    if get_var["lua_webpage_page_request_variable"] == i then
                        r:write(dofile(config.src_directory .. config.views_directory  .. v .. ".lua"):build())
                    end
                end

            end
        end
       

    elseif r.method == 'POST' then
        -- implement something
    else
        
    end
end