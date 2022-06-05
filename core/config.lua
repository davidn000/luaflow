local config = {}
config.__index = config

config.src_directory = "C:/xampp/htdocs/Lua/"
config.views_directory = "views/"

--[[
   custom routes not functional currently
   
   all files will be loaded accordingly:

   request_uri = "/" => "views/App.lua"
   request_uri = "/index" => "views/index.lua"
]] 
config.routes = {
    ["path/to/thing"] = "",
}

return config