require 'apache2'
--require 'core/config'

function handle(r)
    
    -- Set MIME type to text/plain:
    r.content_type = "text/html"
    --translate_name(r)
    -- return the "Hello World" text:

end



function translate_name(r)
   
    if r.uri == config.src_directory .. "index.lua" then
        
        r.filename = r.document_root .. "/hello.txt"
        return apache2.OK
    end
    -- we don't care about this URL, give another module a chance
    return apache2.DECLINED
end