local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

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
  dashboard.button("C", "  New course", ":lua CreateNewCourse()<CR>"),
  dashboard.button("J", "  New journal", ":lua CreateNewJournal()<CR>"),
  dashboard.button("p", "󰐯  New project", ":lua CreateNewProject()<CR>"),
  dashboard.button("n", "󰎜  New quick note", ":lua CreateQuickNote()<CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("c", "  Config", ":edit ~/.config/<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

local function footer()
  local quotes = {
    "You have power over your mind - not outside events.",
    "The happiness of your life depends upon the quality of your thoughts.",
    "Dwell on the beauty of life. Watch the stars, and see yourself running with them.",
    "Our life is what our thoughts make it.",
    "If it is not right do not do it; if it is not true do not say it.",
    "Waste no more time arguing about what a good man should be. Be one.",
    "He who fears death will never do anything worthy of a man who is alive.",
    "It is not death that a man should fear, but he should fear never beginning to live.",
    "Begin at once to live, and count each separate day as a separate life.",
    "Don’t explain your philosophy. Embody it.",
    "We suffer more often in imagination than in reality.",
    "Luck is what happens when preparation meets opportunity.",
    "The best revenge is not to be like your enemy.",
    "It does not matter how slowly you go as long as you do not stop.",
    "Accept the things to which fate binds you, and love the people with whom fate brings you together.",
    "You don’t have to turn this into something. It doesn’t have to upset you.",
    "The obstacle is the way.",
    "When we are no longer able to change a situation, we are challenged to change ourselves.",
    "Think of the whole universe of matter and how small your share.",
    "Silence is a lesson learned through life’s many sufferings.",
    "Be tolerant with others and strict with yourself.",
    "He who lives in harmony with himself lives in harmony with the universe.",
    "Today I escaped anxiety. Or no, I discarded it, because it was within me.",
    "To improve is to change; to be perfect is to change often.",
    "Self-control is strength. Calmness is mastery.",
    "Never let the future disturb you. You will meet it, if you have to, with the same weapons of reason which today arm you against the present.",
    "No man is free who is not master of himself.",
    "It is the power of the mind to be unconquerable.",
  }
  return "\n\n" .. "« " .. quotes[math.random(#quotes)] .. " »"
end


dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "DashboardHeader"
dashboard.section.buttons.opts.hl = "DashboardButtons"
dashboard.section.footer.opts.hl = "DashboardFooterBold"

alpha.setup(dashboard.opts)

-- Disable folding for the Alpha buffer
vim.cmd([[
  autocmd FileType alpha setlocal nofoldenable
]])

function CreateNewNote()
  local notes_dir = "~/Documents/Notes/"
  local input = vim.fn.input("New note name: ")
  if input == "" then
    print("Aborted: no name provided.")
    return
  end
  local filepath = notes_dir .. input .. ".md"
  vim.cmd("edit " .. filepath)
end

local dir = "~/Projects/juicy_second_brain/Scripts/"

function CreateNewCourse()
    local course_subject = vim.fn.input("Course subject: ")
    local course_name = vim.fn.input("Course name: ")

    local script_path = dir .. "new_course.sh"
    local command = string.format('%s "%s" "%s"', script_path, course_subject, course_name)

    os.execute(command)
    vim.cmd("edit " .. "~/Projects/juicy_second_brain/Notes/" .. course_subject .. "/" .. course_name .. ".md")
end

function CreateNewJournal()
    local script_path = dir .. "new_journal.sh"
    os.execute(script_path)
    vim.cmd("edit " .. "~/Projects/juicy_second_brain/Journal/" .. os.date("%Y-%m-%d") .. ".md")
end

function CreateNewProject()
    local project_name = vim.fn.input("Project name: ")

    local script_path = dir .. "new_project.sh"
    local command = string.format('%s "%s"', script_path, project_name)

    os.execute(command)
    vim.cmd("edit " .. "~/Projects/juicy_second_brain/Projects/" .. project_name:gsub(" ", "-") .. "/README.md")
end

function CreateQuickNote()
    local note_name = vim.fn.input("Note name: ")
    vim.cmd("edit " .. "~/Projects/juicy_second_brain/Inbox/" .. note_name)
end

