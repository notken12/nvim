local M = {}

M.dropdown = function()
  local theme = {
    -- theme = "dropdown",

    previewer = false,
    results_title = "Results",

    sorting_strategy = "ascending",
    prompt_cutoff = 1,
    results_cutoff = 1,
    prompt_position = "top",
    layout_config = {
      preview_cutoff = 1, -- Preview should always show (unless previewer = false)
      prompt_position = "top",

      width = function(_, max_columns, _)
        return math.min(max_columns, 80)
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines, 15)
      end,
    },

    border = true,
    -- borderchars = {
    --   prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
    --   results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
    --   preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- },
  }
  return theme

end

return M
