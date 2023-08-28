
local config = require('jaime.config')
config.ensure_lazy()

-- Start lazy.nvim plugin manager.
require('lazy').setup(vim.tbl_extend('keep', config.user_lazy_opts(), {
	spec = {
		{ import = 'jaime.plugins' },
		{ import = 'jaime.plugins.extras.lang.go' },
		{ import = 'jaime.plugins.extras.lang.json' },
		{ import = 'jaime.plugins.extras.lang.python' },
		{ import = 'jaime.plugins.extras.lang.yaml' },

		-- This will load a custom user lua/plugins.lua or lua/plugins/*
		config.has_user_plugins() and { import = 'plugins' } or nil,
	},
	concurrency = vim.loop.available_parallelism() * 2,
	defaults = { lazy = true, version = false },
	dev = { path = config.path_join(vim.fn.stdpath('config'), 'dev') },
	install = { missing = true, colorscheme = {} },
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
	ui = { border = 'rounded' },
	diff = { cmd = 'terminal_git' },
	performance = {
		rtp = {
			disabled_plugins = {
				'gzip',
				'vimballPlugin',
				'matchit',
				'matchparen',
				'2html_plugin',
				'tarPlugin',
				'netrwPlugin',
				'tutor',
				'zipPlugin',
			},
		},
	},
}))

config.setup()
