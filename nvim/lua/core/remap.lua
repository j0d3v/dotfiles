local opts = { noremap = true, silent = true }
local telescope = require("telescope")
local conform = require("conform")
local builtin = require("telescope.builtin")
local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- Shorten function name
--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shotcut
vim.keymap.set("n", "<C-q>", ":q!<CR>", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-m>", ":bdelete<CR>", opts)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-3<CR>gv-gv", opts)

vim.keymap.set('n', 'tr', builtin.treesitter)
vim.keymap.set('n', '<C-l>', builtin.buffers)
vim.keymap.set('n', '<C-b>', telescope.extensions.file_browser.file_browser)
vim.keymap.set('n', 'gb', builtin.git_bcommits)
vim.keymap.set('n', 'gs', builtin.git_status)
vim.keymap.set('n', '<C-f>', builtin.find_files)
vim.keymap.set('n', '<C-d>', builtin.diagnostics)
vim.keymap.set('n', "<A-f>", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end)
vim.keymap.set('n', "<C-s>", function()
    vim.api.nvim_command(":w")
end)
vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', 'bd', builtin.lsp_definitions)
vim.keymap.set('n', 'bt', builtin.lsp_type_definitions)
vim.keymap.set('n', 'bi', builtin.lsp_implementations)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'bh', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<C-h>', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', 'cp', vim.lsp.buf.code_action, bufopts)
