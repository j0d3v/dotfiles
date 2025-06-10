require("core.options")
require("core.packer")
require("core.remap")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.formatting")

require("onedarkpro").setup({
    options = {
        transparency = true
    }
})

vim.cmd("colorscheme onedark")
