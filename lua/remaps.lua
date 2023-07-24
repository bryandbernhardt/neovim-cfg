-- Coc explorer ------------------------------------------------------------------
vim.keymap.set("n", "<space>e", "<Cmd>CocCommand explorer<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<space>ed", ":CocCommand explorer --preset .vim")
vim.keymap.set("n", "<space>ef", ":CocCommand explorer --preset floating")
vim.keymap.set("n", "<space>ec", ":CocCommand explorer --preset cocConfig")
vim.keymap.set("n", "<space>eb", ":CocCommand explorer --preset buffer")
vim.keymap.set("n", "<space>el", ":CocList explPresets")



-- Adding empty lines ------------------------------------------------------------
vim.keymap.set("n", "op", "o<Esc>k")
vim.keymap.set("n", "oi", "O<Esc>j")
vim.keymap.set("n", "oo", "A<CR>")



-- Tabs --------------------------------------------------------------------------
vim.keymap.set("n", "te", ":tabe<CR>")
vim.keymap.set("n", "ty", ":bn<CR>")
vim.keymap.set("n", "tr", ":bp<CR>")
vim.keymap.set("n", "td", ":bd<CR>")



-- Splits ------------------------------------------------------------------------
vim.keymap.set("n", "th", ":split<CR>")
vim.keymap.set("n", "tv", ":vsplit<CR>")
vim.keymap.set("n", "tt", ":q<CR>")



-- Nvim-tree ---------------------------------------------------------------------
vim.keymap.set("n", "<C-a>", ":NvimTreeToggle<CR>")

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end


-- vim.keymap.set("n", "", "")
-- vim.keymap.set("n", "", "")