local vim = vim
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local function custom_attach(client, bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		use_lspsaga = false,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hi_parameter = "Search",
		handler_opts = { "double" },
	})
	require("illuminate").on_attach(client)
    require("nvim-navic").attach(client, bufnr)
end

local lspconfig = require('lspconfig')

local servers = { 'clangd', 'pyright', 'sumneko_lua' }
for _, lsp in pairs(servers) do
    if lsp == "clangd" then -- c++
        lspconfig.clangd.setup({
            capabilities = capabilities,
			single_file_support = true,
			on_attach = custom_attach,
            cmd = {
                "clangd",
                "--background-index",
                "--suggest-missing-includes",
                "--clang-tidy",
                "--header-insertion=iwyu",
            }
        })
    else
        lspconfig[lsp].setup({
            on_attach = custom_attach,
            capabilities = capabilities,
        })
    end
end

local saga = require("lspsaga")
saga.init_lsp_saga()

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local border = function(hl)
    return {
        { "╭", hl },
        { "─", hl },
        { "╮", hl },
        { "│", hl },
        { "╯", hl },
        { "─", hl },
        { "╰", hl },
        { "│", hl },
    }
end

require("luasnip").config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})
require("luasnip/loaders/from_vscode").lazy_load()

local cmp_window = require("cmp.utils.window")

function cmp_window:has_scrollbar()
    return false
end

local compare = require("cmp.config.compare")

local cmp = require("cmp")
cmp.setup({
    window = {
        completion = {
            border = border("CmpBorder"),
        },
        documentation = {
            border = border("CmpDocBorder"),
        },
    },
    sorting = {
        comparators = {
            -- require("cmp_tabnine.compare"),
            compare.offset,
            compare.exact,
            compare.score,
            require("cmp-under-comparator").under,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },
    formatting = {
        format = function(entry, vim_item)
            local lspkind_icons = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "",
                Event = "",
                Operator = "",
                TypeParameter = "",
            }
            -- load lspkind icons
            vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)

            vim_item.menu = ({
                buffer = "[BUF]",
                nvim_lsp = "[LSP]",
                path = "[PATH]",
                luasnip = "[SNIP]",
            })[entry.source.name]

            return vim_item
        end,
    },
    -- You can set mappings if you want
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-h>"] = function(fallback)
            if require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
            else
                fallback()
            end
        end,
        ["<C-l>"] = function(fallback)
            if require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
            else
                fallback()
            end
        end,
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    -- You should specify your *installed* sources.
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
    },
})

require("nvim-autopairs").setup()
-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local handlers = require("nvim-autopairs.completion.handlers")
cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done({
        filetypes = {
            -- "*" is an alias to all filetypes
            ["*"] = {
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method,
                    },
                    handler = handlers["*"],
                },
            },
            -- Disable for tex
            tex = false,
        },
    })
)

