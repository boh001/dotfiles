return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  event = "VeryLazy",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({ "x" }, "<C-k>", function()
      mc.matchAddCursor(-1)
    end)
    set({ "x" }, "<C-j>", function()
      mc.matchAddCursor(1)
    end)
    set({ "x" }, "<leader>k", function()
      mc.matchSkipCursor(-1)
    end)
    set({ "x" }, "<leader>j", function()
      mc.matchSkipCursor(1)
    end)
    set({ "x" }, "<leader>l", mc.prevCursor)
    set({ "x" }, "<leader>h", mc.nextCursor)
    set({ "x" }, "x", mc.deleteCursor)
    set("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      else
        mc.clearCursors()
      end
    end)

    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
