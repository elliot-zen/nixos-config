require("dapui").setup()
local dap = require("dap")

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "DapBreakpointCondition" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⭕", texthl = "DapBreakpointRejected" })
vim.fn.sign_define("DapStopped", {
  text = "▶",
  texthl = "DapBreakpoint",
  linehl = "DapCurrentLine",
  numhl = "DiagnosticSignWarn",
})
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
    -- add this if on windows, otherwise server won't open successfully
    -- detached = false
  }
}
dap.set_log_level("TRACE")
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "ServerMain",
    request = "launch",
    program = "./cmd/server",
  },
  {
    type = "delve",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${fileDirname}",
  },
}
