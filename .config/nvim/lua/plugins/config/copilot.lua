return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Disable default <Tab> mapping
    vim.g.copilot_no_tab_map = true

    -- Accept suggestion with Ctrl-L
    vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
    })
  end,
}
