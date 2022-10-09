local ok, noice = pcall(require, "noice")
if not ok then
  return
end

noice.setup({
  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 2, 3 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
      },
    },
  },
})
