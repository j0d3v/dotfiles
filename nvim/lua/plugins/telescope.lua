local ok, telescope = pcall(require, "telescope")
if not ok then return end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules" },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
                ["n"] = {
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                },
            },
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
        },
    },
})

telescope.load_extension("file_browser")
