return {
	{
		dir = "~/code/projects/callisto",
		lazy = true,
		init = function()
			vim.cmd.colorscheme("callisto")
		end,
	},
	"whatyouhide/vim-gotham",

	{
		--   dir = '~/code/projects/enma.nvim',
		"pepizarro/enma.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		-- init = function()
		-- 	vim.cmd.colorscheme("enma")
		-- end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		-- init = function()
		--   vim.cmd.colorscheme 'tokyonight-night'
		-- end,
	},

	"yorumicolors/yorumi.nvim",

	{
		"tjdevries/colorbuddy.nvim",
		--
		-- init = function()
		-- 	local colorbuddy = require("colorbuddy")
		--
		-- 	colorbuddy.colorscheme("swordfish")
		--
		-- 	-- And then modify as you like
		-- 	local Color = colorbuddy.Color
		-- 	local colors = colorbuddy.colors
		-- 	local Group = colorbuddy.Group
		-- 	local groups = colorbuddy.groups
		-- 	local styles = colorbuddy.styles
		--
		-- 	-- Use Color.new(<name>, <#rrggbb>) to create new colors
		-- 	-- They can be accessed through colors.<name>
		-- 	Color.new("background", "#67b598")
		-- 	Color.new("red", "#cc6666")
		-- 	Color.new("green", "#99cc99")
		-- 	Color.new("yellow", "#f0c674")
		--
		-- 	-- Define highlights in terms of `colors` and `groups`
		-- 	Group.new("Function", colors.yellow, colors.background, styles.bold)
		-- 	Group.new("luaFunctionCall", groups.Function, groups.Function, groups.Function)
		--
		-- 	-- Define highlights in relative terms of other colors
		-- 	Group.new("Error", colors.red:light(), nil, styles.bold)
		--
		-- 	-- If you want multiple styles, just add them!
		-- 	Group.new("italicBoldFunction", colors.green, groups.Function, styles.bold + styles.italic)
		--
		-- 	-- If you want the same style as a different group, but without a style: just subtract it!
		-- 	Group.new("boldFunction", colors.yellow, colors.background, groups.italicBoldFunction - styles.italic)
		-- end,
	},
	-- {
	--   'dasupradyumna/midnight.nvim',
	--   lazy = false,
	--   priority = 1000,
	--   init = function()
	--     -- Load the colorscheme here.
	--     -- Like many other themes, this one has different styles, and you could load
	--     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
	--     vim.cmd.colorscheme 'midnight'
	--
	--     -- You can configure highlights by doing something like:
	--     vim.cmd.hi 'Comment gui=none'
	--   end,
	-- },
}
