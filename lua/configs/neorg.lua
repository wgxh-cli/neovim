return function()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.completion"] = { -- Setting up a completion engine
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
            projects = "~/notes/projects",
            ideas = "~/notes/ideas",
          },
        },
      },
      ["core.presenter"] = {
        config = {
          zen_mode = "zen-mode",
        },
      },
    },
  }
end
