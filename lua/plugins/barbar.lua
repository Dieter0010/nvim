return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for icons
    "lewis6991/gitsigns.nvim",     -- optional, for git status
  },
  init = function()
    vim.g.barbar_auto_setup = false -- disable auto-setup so we control it
  end,
  config = function()
    require("barbar").setup({
	  auto_hide = true,
      animation = true,
      tabpages = true,
      focus_on_close = "left",
      hide = { extensions = false, inactive = false },
      icons = {
        buffer_index = true,
        buffer_number = false,
        button = "",
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
        },
        gitsigns = {
          added = { enabled = true, icon = " " },
          changed = { enabled = true, icon = " " },
          deleted = { enabled = true, icon = " " },
        },
        separator = { left = "▎", right = "" },
        separator_at_end = true,
        modified = { button = "●" },
        pinned = { button = "", filename = true },
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = "×" },
        visible = { modified = { buffer_number = true } },
      },
      sidebar_filetypes = {
        NvimTree = true,
        undotree = { text = "undotree", align = "left" },
        ["neo-tree"] = { event = "BufWipeout" },
        Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
      },
      maximum_length = 25,
    })
	local map = vim.keymap.set
	local opts = { noremap = true, silent = true }

	-- Navigate buffers
	map("n", "<leader>bh", "<Cmd>BufferPrevious<CR>", opts) -- go left
	map("n", "<leader>bl", "<Cmd>BufferNext<CR>", opts)     -- go right

	-- Move buffer positions
	map("n", "<leader>bH", "<Cmd>BufferMovePrevious<CR>", opts)
	map("n", "<leader>bL", "<Cmd>BufferMoveNext<CR>", opts)

	-- Go to buffer 1–9, and 0 for last
	for i = 1, 9 do
	  map("n", "<leader>" .. i, "<Cmd>BufferGoto " .. i .. "<CR>", opts)
	end
	map("n", "<leader>b0", "<Cmd>BufferLast<CR>", opts)

	-- Pin and close
	map("n", "<leader>bp", "<Cmd>BufferPin<CR>", opts)
	map("n", "<leader>bc", "<Cmd>BufferClose<CR>", opts)

	-- Sorting
	map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
	map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
	-- map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
  end,
  event = "BufReadPre", -- or remove this to load on startup
}
