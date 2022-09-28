local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  return
end

illuminate.configure({
  delay = 100,
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "alpha",
    "TelescopePrompt",
    "NvimTree",
  },
})
