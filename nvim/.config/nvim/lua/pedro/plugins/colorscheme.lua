return {
	"whatyouhide/vim-gotham",

	{
		--   dir = '~/code/projects/enma.nvim',
		"pepizarro/enma.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		init = function()
			vim.cmd.colorscheme("enma")
		end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		-- init = function()
		--   vim.cmd.colorscheme 'tokyonight-night'
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
