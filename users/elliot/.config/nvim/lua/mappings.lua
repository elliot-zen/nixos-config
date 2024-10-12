require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>du", "<cmd> lua require('dapui').toggle() <cr>")
map("n", "<leader>db", "<cmd> lua require'dap'.toggle_breakpoint() <cr>")
map("n", "<leader>da", "<cmd> lua require('dap').continue()<cr>")
map("n", "<F5>", "<cmd> lua require('dap').continue() <cr>")

map("i", "jk", "<ESC>")
map("n", "<leader>cl", "<cmd> cclose <cr>")
map("n", "<leader>fl", "<cmd> Telescope lsp_document_symbols <cr>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
