require "base"

local bootstraped = require "plugins"

if bootstraped then
    return
end

require "utils"
require "colors"
require "lsp"
