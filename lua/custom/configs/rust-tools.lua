local rt = require "rust-tools"

rt.setup {
  server = {
    settings = {
      ['rust_analyzer'] = {
        ["procMacro"] = {
          enable = true,
        },
        ["cargo"] = {
          ["check"] = {
            ["command"] = "clippy",
          },
          ["buildScript"] = {
            enable = true,
          },
        },
      }
    }
  }
}
