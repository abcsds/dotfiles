local on_attach = function(_, bufnr)

    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { silent = false, bufnr = bufnr, desc = "Rename LSP buffer" })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { silent = false, bufnr = bufnr, desc = "LSP Code action" })

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = false, bufnr = bufnr, desc = "LSP Go to definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = false, bufnr = bufnr, desc = "LSP Go to declaration" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = false, bufnr = bufnr, desc = "LSP Go to implementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = false, bufnr = bufnr, desc = "LSP Go to references" })
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { silent = false, bufnr = bufnr, desc = "LSP Go to type definition" })

    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { silent = false, bufnr = bufnr, desc = "LSP Hover" })
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
        vim.lsp.buf.format()
    end, {})
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { silent = false, bufnr = bufnr, desc = "LSP References" })
    vim.keymap.set("n", "<leader>s", require("telescope.builtin").lsp_document_symbols, { silent = false, bufnr = bufnr, desc = "LSP Document symbols" })
    vim.keymap.set("n", "<leader>S", require("telescope.builtin").lsp_workspace_symbols, { silent = false, bufnr = bufnr, desc = "LSP Workspace symbols" })
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- require('lspconfig').tsserver.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     Lua = {
--         telemetry = { enable = false },
--     },
-- })