local function telescope_live_grep_open_files()
	require("telescope.builtin").live_grep {
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	}
end

local opts = { noremap = true, silent = true }

local map = vim.keymap.set

map("n", "<leader>cd", vim.cmd.Ex, opts)
map({ "n", "v" }, "<Space>", "<Nop>", opts)
map({ "n", "x" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", opts)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", opts)

-- Diagnostic keymaps
map("n", "]d", function()
	vim.diagnostic.goto_next()
end, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
map("n", "<leader>l", vim.diagnostic.setqflist, { desc = "Open diagnostics quickfix list" })

map("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
map("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

map("n", "<leader>/", telescope_live_grep_open_files, { desc = "[/] Search in Open Files" })
map("n", "<leader>ss", require("telescope.builtin").builtin, { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
map("n", "<leader>f", require("telescope.builtin").find_files, { desc = "[F]ind Files" })
map("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
map("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<C-c>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })

map("n",
	"<leader>S",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)

-- for simple scripting, not for complex projects with args and shit
local runners = {
	python = "python %",
	go = "go run %",
	rust = "cargo run",
	c =	"gcc % -o %:r && ./%:r",
	sh = "./%", -- <leader>x makes the file executable, so we can just run it
	javascript = "node %",
}

map("n", "<leader>R", function ()
	local filetype = vim.bo.filetype
	local cmd = runners[filetype]
	if cmd then
		vim.cmd("w") -- save the shit before running
		vim.cmd("!" .. cmd)
	else
		print("No runner for filetype " .. filetype)
	end
end, { desc = "Run current file" })
