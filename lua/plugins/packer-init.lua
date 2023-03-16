local ls = require "helper.keymap".leader_and_space
local cmd = require "helper.keymap".values.cmd

ls("ps", cmd "PackerSync")
ls("pc", cmd "PackerCompile")

