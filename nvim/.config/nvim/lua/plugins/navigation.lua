return {
  'smoka7/hop.nvim',
  keys = {
    { '<CR>', '<cmd>HopWord<cr>', desc = 'Jump to word' },
  },
  config = function()
    require('hop').setup {
      jump_on_sole_occurrence = false,
    }
  end,
}
