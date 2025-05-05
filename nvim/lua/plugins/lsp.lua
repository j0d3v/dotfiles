---@diagnostic disable: undefined-global

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- General LSP servers
local servers = {
    "gopls",
    "pyright",
    "lua_ls",
    "html",
    "cssls",
    "ts_ls",
    "clangd",
    "jsonls",
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end

-- Intelephense for PHP
lspconfig.intelephense.setup {
    capabilities = capabilities,
    settings = {
        intelephense = {
            stubs = {
                'Core',
                'SPL',
                'imagick',
                'standard',
                'pcre',
                'date',
                'json',
                'ctype',
                'SimpleXML',
            },
            telemetry = { enabled = false },
            completion = { fullyQualifyGlobalConstantsAndFunctions = true },
            phpdoc = { returnVoid = false },
        },
    },
}

-- Tailwind CSS
lspconfig.tailwindcss.setup {
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern(
        'tailwind.config.cjs',
        'tailwind.config.js',
        'tailwind.config.ts',
        'postcss.config.js',
        'postcss.config.ts'
    ),
}

-- Bash (sh, bash, zsh)
lspconfig.bashls.setup {
    capabilities = capabilities,
    filetypes = { "sh", "bash", "zsh" },
}

-- Autopairs
local ok, autopairs = pcall(require, "nvim-autopairs")
if ok then
    autopairs.setup {
        disable_filetype = { "TelescopePrompt", "vim" },
    }
end
