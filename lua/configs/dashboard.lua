local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Seed the random number generator
math.randomseed(os.time())

dashboard.section.header.val = {
	"                                   ",
	"                                   ",
	"                                   ",
	"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
	"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
	"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
	"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
	"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
	"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
	"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
	" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
	" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
	"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
	"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
	"                                   ",
	"                                   ",
	"              by Juic¥             ",
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
  dashboard.button("s", "  Open last session", ":SessionRestore<CR>"),
  dashboard.button("h", "  Web bookmarks", ":silent !xdg-open https://fluoridated-roquefort-298.notion.site <CR>"),
  dashboard.button("w", "  Epita forge", ":silent !xdg-open https://intra.forge.epita.fr <CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Function to get a random inspirational quote
local function footer()
  local quotes = {
    "You have power over your mind - not outside events.",
    "The happiness of your life depends upon the quality of your thoughts.",
    "Dwell on the beauty of life. Watch the stars, and see yourself running with them.",
    "Our life is what our thoughts make it.",
    "If it is not right do not do it; if it is not true do not say it.",
  }
  return "\n\n" .. "« " .. quotes[math.random(#quotes)] .. " »"
end

dashboard.section.footer.val = footer()

-- Set up highlight groups
dashboard.section.header.opts.hl = "DashboardHeader"
dashboard.section.buttons.opts.hl = "DashboardButtons"
dashboard.section.footer.opts.hl = "DashboardFooterBold"

alpha.setup(dashboard.opts)

-- Disable folding for the Alpha buffer
vim.cmd([[
  autocmd FileType alpha setlocal nofoldenable
]])

