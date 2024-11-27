local map = vim.keymap.set -- Create an alias for vim.keymap.set

-- Functions

-- Function to open a terminal in a horizontal split with 30% height
local function open_terminal_horizontal()
	-- Get the total number of lines available in the editor
	local total_height = vim.o.lines - vim.o.cmdheight - 2 -- Subtract command line and status line
	-- Calculate 30% of the total height
	local split_height = math.floor(total_height * 0.3)
	-- Open a horizontal split with the calculated height below the current window
	vim.cmd('belowright ' .. split_height .. 'split')
	-- Open the terminal in the new split
	vim.cmd('terminal')
	-- Start in insert mode
	vim.cmd('startinsert')
end

-- Remap ; to enter command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Map 'jk' to escape insert mode
map("i", "jk", "<ESC>")

-- Delete word and switch to insert mode
map("n", "<leader>a", "caw", { desc = "Delete word and switch to insert mode" })
map("n", "<leader>ca", "ggVGy", { desc = "Copy all page" })

-- Modify content within parentheses
map("n", "<leader>cw", "_ci(", { desc = "Change within parentheses" })

-- NVCHAD mappings

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })

map("n", "<leader>fm", function()
	require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- telescope
-- Live grep in current folder
map("n", "<leader>fw", function()
  require("telescope.builtin").live_grep({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Live grep in current folder" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>t", "<cmd>Telescope colorscheme<CR>", { desc = "Select theme" })

-- Find files in current folder
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })

map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
-- Map <leader>h to open a terminal in a horizontal split
vim.keymap.set('n', '<leader>h', open_terminal_horizontal, { desc = 'Horizontal Terminal' })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- bufferline
vim.api.nvim_set_keymap("n", "<Tab>", [[<Cmd>BufferLineCycleNext<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", [[<Cmd>BufferLineCyclePrev<CR>]], { noremap = true, silent = true })

-- LSP key mappings
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
