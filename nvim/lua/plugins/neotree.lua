return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            -- Close Neo-tree when a file is opened
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    })

    -- Keymap to toggle Neo-tree
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end,
}
