-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "z=", function()
  require("fzf-lua").spell_suggest()
end, { desc = "Spell suggest (fzf)" })

-- Optional: a dedicated leader mapping
map("n", "<leader>h", function()
  require("fzf-lua").spell_suggest()
end, { desc = "Spell suggest (fzf)" })

-- below some text with errors - just for testing
-- som erre in txt
-- a tutj jakś tkst po polskiemu
-- ik heb vel problemen met dez tal...
