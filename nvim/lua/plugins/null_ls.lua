local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })
local event = "BufWritePre"

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<Leader>f", function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end, { buffer = bufnr, desc = "[lsp] format" })

            vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
            vim.api.nvim_create_autocmd(event, {
                group = group,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
                desc = "[lsp] format on save",
            })
        end
    end,
})
