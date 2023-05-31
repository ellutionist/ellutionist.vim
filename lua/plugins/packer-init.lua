local keymap_grp = require "mykeymaps.group"

keymap_grp.new("Packer", "p")
    :add_entry("Sync", "s", "Sync plugins", "PackerSync")
    :add_entry("Compile", "c", "Compile plugins", "PackerCompile")
    :bind()
