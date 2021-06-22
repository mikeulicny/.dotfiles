
-- LSP
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- mappings
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- TODO: set other lsp keymappings if needed
    
end

local servers = { "ccls", "rust_analyzer", "pyls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end
