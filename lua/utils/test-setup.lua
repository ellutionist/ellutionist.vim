return function()
    require "mykeymaps.group".new_or_get(
        "test", "e"
    )
        :add_entry("Nearest", "n", "Test Nearest", "TestNearest")
        :add_entry("File", "f", "Test File", "TestFile")
        :bind()
end
