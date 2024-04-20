require("therealfilko")
require("therealfilko.lazy")

--local gruber = "gruber-darker"
--local catppuccin = "catppuccin"
--local tokyonight = "tokyonight"
local gruvbox = "gruvbox"

function ColorDeezNutz(color)
    color = color or gruvbox
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
ColorDeezNutz()
