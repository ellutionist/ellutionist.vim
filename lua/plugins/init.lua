local packer_bootstrap = (require "plugins.helper").ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'


    for _, plugin_grp in pairs(require "plugins.manifest") do
        for _, plugin in ipairs(plugin_grp) do
            use(plugin)
        end
    end

    if packer_bootstrap then
        require('packer').sync()
    end
end)

require "plugins.packer-init"

return packer_bootstrap
