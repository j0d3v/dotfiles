local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then return end

configs.setup({
    ensure_installed = {
        "bash", "c", "css", "go", "html", "javascript", "lua",
        "markdown", "php", "python", "typescript", "yaml", "cpp", "haskell"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { "yaml" },
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
        filetypes = { "html", "xml", "php" },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
