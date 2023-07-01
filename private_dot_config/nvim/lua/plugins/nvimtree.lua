require('nvim-tree').setup({
    view = {
      signcolumn = 'no',
    },
    renderer = {
      root_folder_label = false,
      highlight_git = true,
      indent_markers = { enable = true },
      icons = {
        webdev_colors = false,
        show = {
          file = true,
          folder = true,
          folder_arrow = false,
          git = true,
        },
        symlink_arrow = ' ⟶ ',
      },
      special_files = {},
    },
    update_focused_file = { enable = true },
    diagnostics = { enable = true },
    filters = {
      custom = { '^.git$' },
    },
  })

  -- Mappings
  vim.keymap.set('n', '<C-n>', function()
    require('nvim-tree.api').tree.toggle()
  end, { noremap = true, silent = true })
