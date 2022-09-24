-- Configs for Hop
-- https://github.com/phaazon/hop.nvim/blob/master/doc/hop.txt
require'hop'.setup {
    keys = 'asdghklqwertyuiopzxcvbnmfj1234567890'
}
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char2()<cr>", {})
