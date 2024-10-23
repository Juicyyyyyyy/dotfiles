require("which-key").setup {
  plugins = {
    marks = false,  -- disable marks
    registers = false,  -- disable registers
    spelling = {
      enabled = true,  -- enable spelling suggestions
      suggestions = 20,  -- how many suggestions to show
    },
  },
  icons = {
    breadcrumb = "»",  -- symbol used in the command line area that shows the current key combination
    separator = "➜",  -- symbol used between a key and its label
    group = "+",  -- symbol prepended to a group
  },
  win = {  -- Use `win` instead of `window` as the newer option
    border = "single",  -- none, single, double, shadow
    position = "bottom",  -- bottom or top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 },  -- extra window padding [top, right, bottom, left]
    winblend = 10,  -- transparency, from 0 to 100
  },
  layout = {
    height = { min = 4, max = 25 },  -- min and max height of the columns
    width = { min = 20, max = 50 },  -- min and max width of the columns
    spacing = 3,  -- spacing between columns
    align = "left",  -- align columns left, center, or right
  },
  show_help = false,  -- disable the help message on the top right
  triggers = { "<leader>", "<localleader>" },  -- triggers must be specified as a table
}

