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

vim.diagnostic.config({
    virtual_text = {
        prefix = '●',
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]
