local function is_dark_mode()
    local result = vim.fn.systemlist('defaults read -g AppleInterfaceStyle')
    return result[1] == 'Dark'
  end
  
  local flavour = (is_dark_mode() and 'latte' or 'mocha')
  
  require('catppuccin').setup({ 
      integrations = {
        gitsigns = true,
        nvimtree = true,
        telescope = true,
    },
    flavour = flavour, 
    transparent_background = true })
  
  vim.cmd.colorscheme('catppuccin')