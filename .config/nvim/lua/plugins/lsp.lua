return {
  "neovim/nvim-lspconfig",
  -- Load LSP only when you open a file
  event = { "BufReadPost", "BufNewFile" },
  
  config = function()
    -- 1. (Optional) Customize server settings
    -- You only use vim.lsp.config() if you want to override the default behavior.
    -- For example, turning off a specific linter inside pylsp:
    -- vim.lsp.config("pylsp", {
    --   settings = {
    --     pylsp = {
    --       plugins = { pycodestyle = { enabled = false } }
    --     }
    --   }
    -- })

    -- 2. Enable the server
    -- This tells Neovim to look into nvim-lspconfig's dictionary for "pylsp",
    -- grab the default rules, and activate it for Python files.
    vim.lsp.enable("pylsp")
  end
}
