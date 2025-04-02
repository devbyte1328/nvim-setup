return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "muniftanjim/nui.nvim",
  },
  lazy = false,
  opts = {},
  config = function()
    require("neo-tree").setup({
      vim.keymap.set('n', '<C-n>', ':Neotree<CR>', { noremap = true }) -- Open Neo-tree
    })
  end
}
