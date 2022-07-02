local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local servers = {
    "sumneko_lua",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "clangd"
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server == "sumneko_lua" then
        local sumneko_opts = require "user.lsp.settings.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require "user.lsp.settings.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "clangd" then
        local clangd_opts = require "user.lsp.settings.clangd"
        opts = vim.tbl_deep_extend("force", clangd_opts, opts)
    end

    lspconfig[server].setup(opts)
end
