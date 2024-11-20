require("mason").setup()
require("mini.diff").setup()
require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "ollama",
    },
    inline = {
      adapter = "ollama",
    },
    agent = {
      adapter = "ollama",
    },
  },
})

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	view = {
		width = 30
	},
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
			}
		}
	},
})

vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 't', ':NvimTreeFocus<CR>', { noremap = true })
