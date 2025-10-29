-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    }
    vim.keymap.set('n', '<C-b>', ':Neotree toggle<CR>', { desc = 'Toggle file explorer' })
    vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', { desc = 'Toggle file explorer' })
    vim.keymap.set('n', '<leader>f', ':Neotree filesystem reveal<CR>', { desc = 'Open file explorer to current active file'})
  end,
}