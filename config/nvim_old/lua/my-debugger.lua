local dap = require('dap')
dap.set_log_level('TRACE');

-- Enable virtual text.
vim.g.dap_virtual_text = true

-- Setup for debugging in Node
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/vscode-node-debug2/out/src/nodeDebug.js'},
}


-- Setup for debugging in Chrome
dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/vscode-chrome-debug/out/src/chromeDebug.js"}
}

-- Configurations
local js_for_chrome = {
    "typescript",
    "javascriptreact",
    "typescriptreact",
}

for _, lang in ipairs(js_for_chrome) do
    dap.configurations[lang] = {
        {
            type = "chrome",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}"
        }
    }
end

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}"
  }
}