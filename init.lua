vim.g.mapleader = " " -- Set global leader key to space
vim.g.maplocalleader = " " -- Set local leader key to space

-- Visuals
vim.cmd.colorscheme("default") -- Set colorscheme to 'default'
vim.api.nvim_set_hl(0, "Normal", { bg = "None" }) -- Make Normal background transparent
vim.api.nvim_set_hl(0, "NormalNC", { bg = "None" }) -- Make inactive Normal background transparent
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None" }) -- Make EndOfBuffer background transparent

vim.opt.termguicolors = true -- Enable 24-bit RGB color
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.colorcolumn = "80" -- Highlight column 80 (code style guide)
vim.opt.showmatch = true -- Highlight matching parens
vim.opt.matchtime = 2 -- Delay in 1/10 seconds for match highlighting
vim.opt.cmdheight = 1 -- Command line height
vim.opt.showmode = false -- Don’t show mode (like -- INSERT --)
vim.opt.pumheight = 10 -- Max items in popup menu
vim.opt.pumblend = 10 -- Transparency for popup menu
vim.opt.winblend = 0 -- Transparency for floating windows
vim.opt.conceallevel = 0 -- Show concealed text normally
vim.opt.concealcursor = "" -- Show all concealed text in all modes
vim.opt.lazyredraw = true -- Don’t redraw screen while executing macros
vim.opt.synmaxcol = 1000 -- Stop syntax highlighting after 1000 columns
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.wrap = true -- Enable line wrapping
vim.opt.cursorline = true -- Highlight current line
vim.opt.fixendofline = true -- Automatically fix missing newline at end of file

-- Indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Number of spaces per tab
vim.opt.shiftwidth = 4 -- Number of spaces per indentation level
vim.opt.softtabstop = 4 -- Number of spaces for tab in insert mode
vim.opt.smartindent = true -- Auto indent new lines smartly
vim.opt.autoindent = true -- Copy indent from current line when starting a new one

-- Search
vim.opt.hlsearch = false -- Don’t highlight search matches
vim.opt.incsearch = true -- Show match while typing
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Override ignorecase if search has capital letters

-- Files
vim.opt.backup = false -- Disable backup files
vim.opt.writebackup = false -- Disable backup before writing file
vim.opt.swapfile = false -- Disable swap files
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = vim.fn.expand("~/.nvim/undodir") -- Directory to store undo files
vim.opt.autoread = true -- Auto reload file if changed outside
vim.opt.autowrite = false -- Don’t auto-write files

-- Most important remap. Period.
vim.keymap.set("i", "jk", "<Esc>", { noremap = true }) -- Escape insert mode with jk
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Buffers
vim.keymap.set("n", "<leader>bo", ":vnew<CR>", { desc = "Open new empty buffer on the left" })
vim.keymap.set("n", "<leader>bc", ":bdelete<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Buffer next" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Buffer previous" })

-- Windows
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Window split vertical" })
vim.keymap.set("n", "<leader>ws", ":split<CR>", { desc = "Window split horizontal" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Navigate to left window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Navigate to right window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Navigate to top window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Navigate to bottom window" })
vim.keymap.set("n", "<leader>wc", ":close<CR>", { desc = "Close current window" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equalize window sizes" })
vim.keymap.set("n", "<leader>wrn", function() vim.cmd("vertical resize -" .. vim.v.count1) end, { desc = "Resize window narrower" })
vim.keymap.set("n", "<leader>wrw", function() vim.cmd("vertical resize +" .. vim.v.count1) end, { desc = "Resize window wider" })
vim.keymap.set("n", "<leader>wrk", function() vim.cmd("resize +" .. vim.v.count1) end, { desc = "Resize window taller" })
vim.keymap.set("n", "<leader>wrj", function() vim.cmd("resize -" .. vim.v.count1) end, { desc = "Resize window shorter" })

-- Tabs
vim.opt.showtabline = 2 -- Always show tab line
vim.opt.tabline = "" -- Disable custom tabline (default UI)
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tm", ":tabmove<CR>", { desc = "Move tab" })
vim.keymap.set("n", "<leader>tl", ":tabmove +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader>th", ":tabmove -1<CR>", { desc = "Move tab left" })

for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, ":tabn " .. i .. "<CR>", { desc = "Switch to tab " .. i })
end

-- Files
vim.keymap.set("n", "<leader>eo", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find", { desc = "Find file" })

-- Centered navigation
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })
vim.keymap.set("n", "<leader>pd", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "<leader>pu", "<C-u>zz", { desc = "Half page up" })

-- Config Shortcut
vim.keymap.set("n", "<leader>cfg", ":e ~/.config/nvim/init.lua<CR>", { desc = "Open config file" })

-- CLI Completion
vim.opt.wildmenu = true -- Enable wildmenu for command-line completion
vim.opt.wildmode = "longest:full,full" -- Completion mode: longest common part first, then full
vim.opt.wildignore:append({
    "*.o", -- object files
    "*.a", -- static libraries
    "*.so", -- shared libraries
    "*.out", -- output binaries
    "*.dSYM/**", -- macOS debug symbols
    "*/build/**", -- typical build folder
    "*/bin/**", -- binaries
    "*/obj/**", -- object files folder
    "*.swp", -- Vim swap files
    "*.tmp", -- temp files
    "*.log", -- logs
})

-- Diff
vim.opt.diffopt:append("linematch:60") -- Better diff algorithm for line matching

-- Misc
vim.opt.hidden = true -- Allow buffer switching without saving
vim.opt.errorbells = false -- Disable bell sound on errors
vim.opt.backspace = "indent,eol,start" -- Allow backspace over everything in insert mode
vim.opt.autochdir = false -- Don’t change working directory to file path
vim.opt.iskeyword:append("-") -- Treat dash as part of a word
vim.opt.path:append("**") -- Search recursively in directories for :find and similar
vim.opt.selection = "exclusive" -- Use exclusive selection
vim.opt.mouse = "a" -- Enable mouse in all modes
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.modifiable = true -- Allow buffer modification
vim.opt.encoding = "UTF-8" -- Set encoding to UTF-8
vim.opt.redrawtime = 10000 -- Increase redraw time for large files
vim.opt.maxmempattern = 20000 -- Increase memory for pattern matching
vim.opt.updatetime = 300 -- Delay before triggering CursorHold
vim.opt.timeoutlen = 500 -- Mapped sequence timeout length
vim.opt.ttimeoutlen = 0 -- Timeout for key codes
vim.opt.completeopt = { "menuone", "noinsert", "noselect" } -- Better completion menu

-- Auto commands group
local autoCommandGroup = vim.api.nvim_create_augroup("CustomConfig", {})

-- Delete terminal buffers after they close
vim.api.nvim_create_autocmd("TermClose", {
    group = autoCommandGroup,
    callback = function(args)
        local bufnr = args.buf
        if vim.api.nvim_buf_is_valid(bufnr) then
            vim.api.nvim_buf_delete(bufnr, { force = true })
        end
    end,
})

-- Resize
vim.api.nvim_create_autocmd("VimResized", {
    group = autoCommandGroup,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Create dirs
vim.api.nvim_create_autocmd("BufWritePre", {
    group = autoCommandGroup,
    callback = function()
        local dir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

-- Auto-reload when switching back to a buffer or window
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = autoCommandGroup,
    pattern = "*",
    command = "checktime",
})

