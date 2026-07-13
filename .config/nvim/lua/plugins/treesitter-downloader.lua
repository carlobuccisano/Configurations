return {
  "romus204/tree-sitter-manager.nvim",
  -- Note: You MUST have 'tree-sitter-cli' installed on your OS for this to work
  config = function()
    require("tree-sitter-manager").setup({
      ensure_installed = { "python", "html", "json", "go", "typescript" }, 
    })
  end
}
