local config = {}
config.__index = config

config.src_directory = "C:/xampp/htdocs/luaflow/"
config.views_directory = "views/"

--[[
   if routes is left empty all the files will be loaded accordingly:

   request_uri = "/" => "views/App.lua"
   request_uri = "/index" => "views/index.lua"

   Otherwise "/" => index (App.lua)
]] 
config.routes = {

}

return config