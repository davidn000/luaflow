--[[
    core entry
]]


local core = {}
core.__index = core
core.request = nil


core.head = {
    title = "My title",
    stylesheets = {
        "path/to/stylesheet.css"
    },

    etc = {
        "<extra_tag/>"
    },

}

core.style = [[
    h1 {
        font-color: green;
    }
]]

function core:print(data)
    core.request:puts(data)
end

function core:render()
    return [[]]
end

function core:build()
    return [[
        <html>
    ]]..self:build_head()..self:render()..[[
        </html>
    ]]
end

function core:build_head()
    local build = ""
    build = build .. "<head>"

    build = build .. "<title>" .. self.head.title .. "</title>"

    if self.head.etc then
        for _,v in pairs(self.head.etc) do
            build = build .. v
        end      
    end


    -- Building Styles --

    build = build .. "<style type='text/css'>" .. self.style .. "</style>"

    if self.head.stylesheets then
        for _,x in pairs(self.head.stylesheets) do
            build = build.. string.format("<link rel='stylesheet' href='%s'>", x)
        end     
    end

    -- Building Styles End --

    build = build .. "</head>"

    return build

end

return core