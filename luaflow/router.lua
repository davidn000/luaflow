package.path = package.path .. ';C:/xampp/htdocs/luaflow/?.lua'
local config = require("luaflow/config")
local core = require("luaflow/core")

function handle(r)
   
    r:flush()
    r.content_type = "text/html"
    core.request = r
    --r:puts("Hello Lua World!\n")
    --dofile("C:/Xampp/htdocs/Lua/views" .. r.uri .. ".lua")
    if r.method == 'GET' then
        local get_var = r:parseargs()
        
        --r.filename = "C:/Xampp/htdocs/Lua/views/" .. get_var["p"] .. ".lua"
        r:write(dofile(config.src_directory .. config.views_directory  .. get_var["lua_webpage_page_request_variable"] .. ".lua"):build())
        for k, v in pairs( get_var ) do
            --r:puts( string.format("%s: %s\n", k, v) )
        end
    elseif r.method == 'POST' then
        for k, v in pairs( r:parsebody() ) do
            r:puts( string.format("%s: %s\n", k, v) )
        end
    else
        
    end
end