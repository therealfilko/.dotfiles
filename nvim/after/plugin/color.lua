vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_transparent_sidebar = true
vim.g.gruvbox_transparent = true
vim.g.gruvbox_invert_selection = '0'
vim.opt.background = "dark"


local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

hl("SignColumn", {
    bg = "none",
})

hl("ColorColumn", {
    ctermbg = 0,
    bg = "#555555",
})

hl("CursorLineNR", {
    bg = "None"
})

hl("Normal", {
    bg = "none"
})

hl("LineNr", {
    fg = "#5eacd3"
})

hl("netrwDir", {
    fg = "#5eacd3"
})


vim.cmd("colorscheme gruvbox")
