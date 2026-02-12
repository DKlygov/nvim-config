-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Visuals
vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "None" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None" })

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 1000
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Indent
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Files
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.nvim/undodir")

-- Most important remap. Period.
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Buffers
vim.keymap.set(
    "n",
    "<leader>bo",
    ":vnew<CR>",
    { desc = "Open new empty buffer on the left" }
)
vim.keymap.set(
    "n",
    "<leader>bc",
    ":bdelete<CR>",
    { desc = "Close current buffer" }
)
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Buffer next" })
vim.keymap.set(
    "n",
    "<leader>bp",
    ":bprevious<CR>",
    { desc = "Buffer previous" }
)

-- Windows
vim.keymap.set(
    "n",
    "<leader>wv",
    ":vsplit<CR>",
    { desc = "Window split vertical" }
)
vim.keymap.set(
    "n",
    "<leader>ws",
    ":split<CR>",
    { desc = "Window split horizontal" }
)
vim.keymap.set(
    "n",
    "<leader>wh",
    "<C-w>h",
    { desc = "Navigate to left window" }
)
vim.keymap.set(
    "n",
    "<leader>wl",
    "<C-w>l",
    { desc = "Navigate to right window" }
)
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Navigate to top window" })
vim.keymap.set(
    "n",
    "<leader>wj",
    "<C-w>j",
    { desc = "Navigate to bottom window" }
)
vim.keymap.set(
    "n",
    "<leader>wc",
    ":close<CR>",
    { desc = "Close current window" }
)
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equalize window sizes" })
vim.keymap.set("n", "<leader>wrn", function()
    vim.cmd("vertical resize -" .. vim.v.count1)
end, { desc = "Resize window narrower" })
vim.keymap.set("n", "<leader>wrw", function()
    vim.cmd("vertical resize +" .. vim.v.count1)
end, { desc = "Resize window wider" })
vim.keymap.set("n", "<leader>wrk", function()
    vim.cmd("resize +" .. vim.v.count1)
end, { desc = "Resize window taller" })
vim.keymap.set("n", "<leader>wrj", function()
    vim.cmd("resize -" .. vim.v.count1)
end, { desc = "Resize window shorter" })

-- Tabs
vim.opt.showtabline = 2

vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set(
    "n",
    "<leader>tc",
    ":tabclose<CR>",
    { desc = "Close current tab" }
)
vim.keymap.set("n", "<leader>tm", ":tabmove<CR>", { desc = "Move tab" })
vim.keymap.set(
    "n",
    "<leader>tl",
    ":tabmove +1<CR>",
    { desc = "Move tab right" }
)
vim.keymap.set("n", "<leader>th", ":tabmove -1<CR>", { desc = "Move tab left" })

for i = 1, 9 do
    vim.keymap.set(
        "n",
        "<leader>" .. i,
        ":tabn " .. i .. "<CR>",
        { desc = "Switch to tab " .. i }
    )
end

-- Files
vim.keymap.set(
    "n",
    "<leader>eo",
    ":Explore<CR>",
    { desc = "Open file explorer" }
)
vim.keymap.set("n", "<leader>ff", ":find", { desc = "Find file" })

-- Centered navigation
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })
vim.keymap.set("n", "<leader>pd", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "<leader>pu", "<C-u>zz", { desc = "Half page up" })

-- Config Shortcut
vim.keymap.set(
    "n",
    "<leader>cfg",
    ":e ~/.config/nvim/init.lua<CR>",
    { desc = "Open config file" }
)

-- CLI Completion
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({
    "*.o",
    "*.a",
    "*.so",
    "*.out",
    "*.dSYM/**",
    "*/build/**",
    "*/bin/**",
    "*/obj/**",
    "*.swp",
    "*.tmp",
    "*.log",
})

-- Diff
vim.opt.diffopt:append("linematch:60")

-- Misc
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "exclusive"
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

-- Auto commands group
local autoCommandGroup = vim.api.nvim_create_augroup("CustomConfig", {})

-- Delete terminal buffers after they close
vim.api.nvim_create_autocmd("TermClose", {
    group = autoCommandGroup,
    callback = function(ev)
        vim.schedule(function()
            if vim.api.nvim_buf_is_valid(ev.buf) then
                vim.api.nvim_buf_delete(ev.buf, { force = true })
            end
        end)
    end,
})

-- Resize
vim.api.nvim_create_autocmd("VimResized", {
    group = autoCommandGroup,
    command = "wincmd =",
})

-- Create dirs
vim.api.nvim_create_autocmd("BufWritePre", {
    group = autoCommandGroup,
    callback = function(ev)
        local dir = vim.fs.dirname(vim.fs.normalize(ev.match))
        if dir then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

-- Auto-reload when switching back to a buffer or window
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = autoCommandGroup,
    command = "checktime",
})
