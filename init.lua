vim.cmd("let mapleader = ' '")
local vimrc = vim.fn.stdpath("config") .. "/vimrc"
vim.cmd.source(vimrc)

require("preferences")
require("installing-lazy")
require("keymaps")
require("icons").setup()

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	nested = true,

	callback = function()
		vim.cmd.colorscheme(vim.g.SCHEME)
	end,
})

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	callback = function(params)
		vim.g.SCHEME = params.match
	end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*",
  callback = function()
    local first_line = vim.fn.getline(1)
    if first_line:match("^#!.*/bash") then
      vim.bo.filetype = "sh"
    end
  end,
})

local cleaned = {}
for _, file in ipairs(vim.v.oldfiles) do
  if vim.fn.filereadable(file) == 1 then
    table.insert(cleaned, file)
  end
end
vim.v.oldfiles = cleaned
vim.cmd('wshada')
