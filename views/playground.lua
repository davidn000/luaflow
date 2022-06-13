require "string"

local core = require("luaflow/core")
local test = require("templates/test_template")

local playground = {}

setmetatable( playground, { __index = core } )


--[[
    old:
playground.variables = {}
playground.variables.__index = playground.variables



playground.variables.firstname = "Davod"
playground.variables.lastname = "nagaf"
playground.variables.balance = 999
playground.variables.test_t = test:build(playground.variables) -- loading template


]]

playground.variables = {
    firstname="David",
    lastname="Nagaf",
    balance = 912,
    test_t = test:build(playground.variables)
}


function playground:render()
    -- pass on variables to template

    local a = [[
        <h1><b>hello {{firstname}}, {{lastname}}<//b></h1>
    ]]
   -- Loads variable
   
    
    return a
end

return playground