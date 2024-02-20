return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({})

    vim.keymap.set("n", "ha", function() harpoon:list():append() end)
    vim.keymap.set("n", "hr", function() harpoon:list():remove() end)
    vim.keymap.set("n", "hc", function() harpoon:list():clear() end)
    vim.keymap.set("n", "hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "hp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "hn", function() harpoon:list():next() end)
  end
}
