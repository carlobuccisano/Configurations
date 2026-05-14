return {
  -- VimTeX
  { 
    'lervag/vimtex', 
    lazy = false,
	enabled = true,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_complete_close_braces = 1
    end
  },

  -- UltiSnips
  { 
    'SirVer/ultisnips',
	enabled = true,
    init = function()
      vim.g.UltiSnipsExpandTrigger = '<Tab>'
      vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
      vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
      vim.g.UltiSnipsSnippetDirectories = { vim.fn.expand('$HOME') .. '/.config/nvim/UltiSnips' }
    end
  },
}
