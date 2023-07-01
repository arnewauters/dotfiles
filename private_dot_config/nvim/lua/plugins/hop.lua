require('hop').setup {
  -- Hop configuration goes there
  keys = 'etovxqpdygfblzhckisuran',
  term_seq_bias = 0.5,
}

local map = vim.keymap.set
local opt = { noremap = true, silent = true }

map('n', '<Leader><Leader>w', function() return require('hop').hint_words() end, opt)
map('n', '<Leader><Leader>c', function() return require('hop').hint_char1() end, opt)
map('n', '<Leader><Leader>l', function() return require('hop').hint_lines() end, opt)
map('n', '<Leader><Leader>v', function() return require('hop').hint_vertical() end, opt)
