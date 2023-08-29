local config = require("jaime.config")
config.ensure_lazy()

-- Start lazy.nvim plugin manager.
require("lazy").setup({
	spec = {
		{ import = "jaime.plugins" },
		{ import = "jaime.plugins.extras.lang.typescript" },
		-- { import = 'jaime.plugins.extras.lang.json' },
		-- { import = 'jaime.plugins.extras.lang.python' },
		-- { import = 'jaime.plugins.extras.lang.yaml' },
	},
	concurrency = vim.loop.available_parallelism() * 2,
	defaults = { lazy = true, version = false },
	dev = { path = config.path_join(vim.fn.stdpath("config"), "dev") },
	install = { missing = true, colorscheme = {} },
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
	ui = { border = "rounded" },
	diff = { cmd = "terminal_git" },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"vimballPlugin",
				"matchit",
				"matchparen",
				"2html_plugin",
				"tarPlugin",
				"netrwPlugin",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- default options
local opts = {
	-- Load the default settings
	-- stylua: ignore
	defaults = {
		autocmds = true, -- jaime.config.autocmds
		keymaps = true,  -- jaime.config.keymaps
		-- jaime.config.options can't be configured here since it's loaded
		-- prematurely. You can disable loading options with the following line at
		-- the top of your lua/config/setup.lua or init.lua:
		-- `package.loaded['jaime.config.options'] = true`
	},

	-- String like `habamax` or a function that will load the colorscheme.
	-- Disabled by default to allow theme-loader.nvim to manage the colorscheme.
	---@type string|fun()
	colorscheme = "",

	features = {
		elite_mode = true,
		window_q_mapping = false,
	},

	-- stylua: ignore
	icons = {
		git = ' ',
		diagnostics = {
			Error = '✘', --   ✘
			Warn = '󰀪',  -- 󰀪 󰳤 󱦄 󱗓 
			Info = 'ⁱ',  --    ⁱ 󰋼 󰋽
			Hint = '',  --  󰌶 
		},
		status = {
			git = {
				added = '₊',    --  ₊
				modified = '∗', --  ∗
				removed = '₋',  --  ₋
			},
			diagnostics = {
				error = ' ',
				warn = ' ',
				info = ' ',
				hint = '󰌶 ',
			},
			filename = {
				modified = '+',
				readonly = '🔒',
				zoomed = '🔎',
			},
		},
		-- Default completion kind symbols.
		kinds = {
			Array = '󰅪 ',  --  󰅪 󰅨 󱃶
			Boolean = '◩ ',  --  ◩ 󰔡 󱃙 󰟡 󰨙
			Class = '󰌗 ', --  󰌗 󰠱 𝓒
			Color = '󰏘 ', -- 󰸌 󰏘
			Constant = '󰏿 ', --   󰏿
			Constructor = '󰆧 ', --  󰆧   
			Copilot = ' ',  -- 
			Enum = '󰕘 ', --  󰕘  ℰ 
			EnumMember = ' ', --  
			Event = ' ', --  
			Field = ' ', -- 󰄶  󰆨  󰀻 󰃒
			File = ' ', --    󰈔 󰈙
			Folder = ' ', --   󰉋
			Function = '󰊕 ', --  󰊕 
			Interface = ' ', --    
			Key = ' ',  -- 
			Keyword = ' ', --   󰌋 
			Method = '󰆧 ', --  󰆧 ƒ
			Module = ' ', --   󰅩 󰆧 󰏗
			Namespace = ' ',  --   󰅩
			Null = ' ',  --  󰟢
			Number = '󰎠 ',  --  󰎠 
			Object = ' ',  --   󰅩
			Operator = '󰃬 ', --  󰃬 󰆕 +
			Package = ' ',  --   󰏖 󰏗
			Property = '󰖷 ', --  󰜢  
			Reference = '󰈝 ', --  󰈝 󰈇
			Snippet = ' ', --  󰘌 ⮡   
			String = '󰅳 ',  --  󰅳
			Struct = ' ', --   𝓢 󰙅 󱏒
			Text = ' ', --   󰉿 𝓐
			TypeParameter = ' ', --  󰊄 𝙏
			Unit = ' ', --   󰑭 
			Value = ' ', --   󰀬 󰎠
			Variable = ' ', --   󰀫 
		},
	},
}
config.setup(opts)
