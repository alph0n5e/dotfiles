return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = "" },
            right_padding = 2
          },
        },
        lualine_z = {
          {
            "location",
            separator = { right = "" },
            padding = { left = 0, right = 0 },
          }
        },
        --       lualine_y = {
        --         {
        --           "progress",
        --           separator = " ",
        --           padding = { left = 1, right = 0 },
        --         },
        --         {
        --           "location",
        --           padding = { left = 0, right = 1 },
        --         },
        --        },
        --       lualine_z = {
        --         {
        --           function()
        --             return " " .. os.date("%R")
        --           end,
        --           separator = { right = "" },
        --         },
        --       },
      },
    })
  end
}
