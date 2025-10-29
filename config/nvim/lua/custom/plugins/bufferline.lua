return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        -- Use 'thin' for a smaller separator
        separator_style = 'thin',
        -- Show buffer numbers
        numbers = 'buffer_id',
        -- Show a close icon for each buffer
        show_buffer_close_icons = true,
        show_close_icon = true,
      }
    }
    -- Keymaps for buffer navigation
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
    vim.keymap.set('n', '<leader>bc', '<Cmd>bdelete<CR>', { desc = '[B]uffer [C]lose' })
  end,
}