-- Simplified colors for bufferline
local colors = {
    bg = '#1d1f21',
    bg_light = "#323b3e",
    fg = '#f7f8f8',
    red = '#fb3d66',
    green = '#6d8c63',
    yellow = '#e4cd7',
    orange = '#bf946b',
    blue = '#8b9eb2',
    violet = '#cdafd9',
}

-- Basic bufferline setup without extra highlights
require('bufferline').setup {
    options = {
        numbers = "ordinal", -- Show buffer index numbers
        close_command = "bdelete! %d", -- Command to close buffers
        right_mouse_command = "bdelete! %d", -- Close buffer with right click
        left_mouse_command = "buffer %d", -- Switch buffer with left click
        indicator = {
            style = 'icon',
            icon = '▎', -- Simple indicator icon
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true,
            },
        },
        show_buffer_icons = true, -- Show file type icons
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "slant", -- Can be 'slant', 'thick', or 'thin'
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'id', -- Sort buffers by their id
        
        custom_filter = function(buf_number)
        -- Exclude terminal buffers from bufferline
        return vim.bo[buf_number].buftype ~= 'terminal'
        end,
    }
}

-- Updated key mappings for buffer navigation
local opts = { noremap = true, silent = true }

-- Close buffer
-- vim.api.nvim_set_keymap('n', '<S-c>', ':bdelete<CR>', opts)

-- Open a new buffer and switch to it
-- vim.api.nvim_set_keymap("n", "<S-b>", ":enew<CR>", opts)

