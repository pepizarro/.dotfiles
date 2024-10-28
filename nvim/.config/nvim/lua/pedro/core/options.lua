-- See `:help vim.opt`

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- tab & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.breakindent = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- fonts
vim.g.have_nerd_font = true
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"

-- appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false

-- themes
vim.opt.termguicolors = true
vim.opt.background = "dark"

--  mouse mode
vim.opt.mouse = "a"

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- Save undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = ' ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.guicursor = {
	-- "n-v-c:block", -- Block cursor in normal, visual, and command mode
	-- "i-ci-ve:ver25", -- Vertical bar in insert, command-line, and visual modes
	-- "r-cr-o:hor20" -- Horizontal bar in replace and operator-pending modes
	"n-v-c:block-Cursor/lCursor",
	"i-ci-ve:ver25-Cursor2/lCursor2",
	"r-cr:hor20,o:hor50"
}


-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
