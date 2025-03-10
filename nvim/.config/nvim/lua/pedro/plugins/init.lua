return {
	-- Misc

	"rktjmp/lush.nvim", -- Color scheme generator

	"github/copilot.vim",
	"nvim-lua/plenary.nvim", -- used in many plugins
	"tpope/vim-sleuth",   -- Detect tabstop and shiftwidth automatically
	"numToStr/Comment.nvim",


	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{ -- moonfly
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"elkowar/yuck.vim",
	},

	-- { -- Collection of various small independent plugins/modules
	-- 	"echasnovski/mini.nvim",
	-- 	version = "0.12.x",
	-- 	config = function()
	-- 		-- Better Around/Inside textobjects
	-- 		--
	-- 		-- Examples:
	-- 		--  - va)  - [V]isually select [A]round [)]paren
	-- 		--  - yinq - [Y]ank [I]nside [N]ext [']quote
	-- 		--  - ci'  - [C]hange [I]nside [']quote
	-- 		require("mini.ai").setup({ n_lines = 500 })
	--
	-- 		-- Add/delete/replace surroundings (brackets, quotes, etc.)
	-- 		--
	-- 		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
	-- 		-- - sd'   - [S]urround [D]elete [']quotes
	-- 		-- - sr)'  - [S]urround [R]eplace [)] [']
	-- 		require("mini.surround").setup()
	--
	-- 		-- Simple and easy statusline.
	-- 		--  You could remove this setup call if you don't like it,
	-- 		--  and try some other statusline plugin
	-- 		-- local statusline = require("mini.statusline")
	-- 		-- -- set use_icons to true if you have a Nerd Font
	-- 		-- statusline.setup({ use_icons = vim.g.have_nerd_font })
	-- 		--
	-- 		-- -- You can configure sections in the statusline by overriding their
	-- 		-- -- default behavior. For example, here we set the section for
	-- 		-- -- cursor location to LINE:COLUMN
	-- 		-- ---@diagnostic disable-next-line: duplicate-set-field
	-- 		-- statusline.section_location = function()
	-- 		-- 	return "%2l:%-2v"
	-- 		-- end
	--
	-- 		-- ... and there is more!
	-- 		--  Check out: https://github.com/echasnovski/mini.nvim
	-- 	end,
	-- },

	-- {
	-- 	"echasnovski/mini.hipatterns",
	-- 	event = "BufReadPre",
	-- 	opts = {
	-- 		highlighters = {
	-- 			hsl_color = {
	-- 				pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
	-- 				group = function(_, match)
	-- 					local utils = require("custom.plugins")
	-- 					--- @type string, string, string
	-- 					local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
	-- 					--- @type number?, number?, number?
	-- 					local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
	-- 					--- @type string
	-- 					local hex_color = utils.hslToHex(h, s, l)
	-- 					return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
	-- 				end,
	-- 			},
	-- 		},
	-- 	},
	-- 	setup = function()
	-- 		vim.opt.packpath = vim.opt.packpath + "," .. vim.fn.stdpath("config") .. "/util"
	-- 	end,
	-- },
}
