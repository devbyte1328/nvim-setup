-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- Key mappings
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', 'y', '"+yy', { noremap = true })
vim.keymap.set('v', 'y', '"+y', { noremap = true })
vim.keymap.set('n', 'p', '"+p', { noremap = true })
vim.keymap.set('v', 'p', '"+p', { noremap = true })
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>:echo ""<CR>', { noremap = true })
vim.keymap.set('n', 'gg', 'gg0', { noremap = true })
vim.keymap.set('n', 'G', 'G$wb', { noremap = true })
vim.keymap.set('n', '<S-y>', 'ggVG"+y', { noremap = true })
vim.keymap.set('n', '<S-p>', 'ggVG"+p', { noremap = true })
vim.keymap.set('n', '<leader>rn', function()
  local is_relative = vim.wo.relativenumber
  vim.wo.relativenumber = not is_relative
  vim.wo.number = is_relative  -- Show absolute numbers when relative is off
end, { desc = "Toggle relative line numbers" })
vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "DAP Continue" })
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "DAP Step Over" })
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, { desc = "DAP Step Into" })
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end, { desc = "DAP Step Out" })
vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>B", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Conditional Breakpoint" })
