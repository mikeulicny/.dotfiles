-- neovim tree
require'nvim-tree'.setup {
    -- disables the netrw completely
    disable_netrw   = true,
    --hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = true,
    git = {
        ignore = false,
    },
    view = {
        -- width of the window, can be either a number (columns) or a string in '%', for left or right side placement
        width = 30,
        -- height of the window, can be either a number (columns) or a string in '%', for top or bottom side placement
        height = 30,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = 'left',
        signcolumn = "yes",
    },
    renderer = {
        add_trailing = false,
        highlight_git = true,
        icons = {
            git_placement = "signcolumn",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true
            },
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "凜",
                    untracked = "",
                    deleted = "ﮁ",
                    ignored = ""
                },
            },
        },
    },
}

-- Autocomplete setup
local cmp = require("cmp")
vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' }
    }
})

-- LSP
local opts = { noremap = true, silent = true }
-- See ':help vim.diagnostic.*' for documentation on any of the below functions
vim.api.nvim_set_keymap('n', 'e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

-- Use an on_attach function to only map the following keys after the language server
-- attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- mappings
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    
    -- Deprecated
    -- buf_set_keymap('n', 'e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

    -- TODO: set other lsp keymappings if needed
end

local servers = { "ccls", "rust_analyzer", "pyright" }
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150
        }
    }
end

-- LSP diagnostic settings
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        signs = true,
        update_in_insert = true,
        virtual_text = false
    }
)
