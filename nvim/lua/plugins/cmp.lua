local luasnip = require('luasnip')

local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "󰙅",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "󰜰",
    Module = "󰏗",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "󰕘",
    Keyword = "󰌋",
    Snippet = "󰘍",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "󰕘",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "󰂡",
    Operator = "󰆕",
    TypeParameter = "󰊄",
}

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

-- Setup nvim-cmp
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = {
            border = border "CmpBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
            border = border "CmpDocBorder",
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            else
                fallback() -- This triggers the default <CR> behavior (i.e., newline).
            end
        end, { 'i', 's' }),
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = kind_icons[vim_item.kind] or vim_item.kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'path' },
        { name = 'cmdline' },
    }
})

-- Lazy load LuaSnip snippets
local has_snippets = require('luasnip').get_snippets()
if has_snippets then
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })
end
