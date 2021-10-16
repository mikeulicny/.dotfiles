-- neovim tree
require'nvim-tree'.setup {
    -- disables the netrw completely
    disable_netrw   = true,
    -- hijack netrw window on startup
    hijack_netrw = true,
    -- open the tree when running this setup function
    open_on_setup = false,
    -- will not open on setup if the filetype is in this list
    ignore_ft_on_setup = {},
    -- closes neovim automatically when the tree is the last **WINDOW** in the view
    auto_close = false,
    -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    open_on_tab = false,
    -- hijacks new directory buffers when they are opened
    update_to_buf_dir = {
        -- enable the feature
        enable = true,
        -- allow to open the tree if it was previously closed
        auto_open = true
    },
    --hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = false,
    -- updates the root directory of the tree on 'DirChanged' (when you run ':cd' usually)
    update_cwd = false,
    -- update the focused file on 'BufEnter', un-collapse the folders recursively until it finds the file
    update_focused_file = {
        -- enables the feature
        enable = false,
        -- update the root directory of the tree to the one of the folders containing the file if the file is not under the current root directory
        -- only relevant when 'update_focused_file.enable' is true
        update_cwd = false,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when 'update_focused_file.update_cwd' is true and 'update_focused_file.enable' is true
        ignore_list = {}
    },
    -- configuration options for the system open command ('s' in the tree by default)
    system_open = {
        -- the command to run this, leaving as nil should work in most cases
        cmd = nil,
        -- the command arguments as a list
        args = {}
    },
    view = {
        -- width of the window, can be either a number (columns) or a string in '%', for left or right side placement
        width = 30,
        -- height of the window, can be either a number (columns) or a string in '%', for top or bottom side placement
        height = 30,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = 'left',
        -- if true the tree will resize itself after opening a file
        auto_resize = true,
        mappings = {
            -- custom only false will merge the list with the default mappings
            -- if true, it will only use your list to set the mappings
            custom_only = false,
            -- list of mappings to set on the tree manually
            list = {}
        }
    }
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
        ["<CR>"] = cmp.mapping.confirm({ select = true })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' }
    }
})

-- LSP
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- mappings
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    
    buf_set_keymap('n', 'e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

    -- TODO: set other lsp keymappings if needed
end

local servers = { "ccls", "rust_analyzer" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150
        },
        --handlers = {
            --["textDocument/publishDiagnostics"] = vim.lsp.with(
            --vim.lsp.diagnostic.on_publish_diagnostics, {
                --underline = true,
                --signs = true,
                --update_in_insert = true,
                --virtual_text = false
            --})
        --}
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
