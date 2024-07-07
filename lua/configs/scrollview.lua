local present, scrollview = pcall(require, "scrollview")

if not present then
  return
end

scrollview.setup {
  mode = "virtual",
  winblend = 0,
  signs_on_startup = { "diagnostics", "folds", "marks", "search", "spell" },
  excluded_filetypes = {
    "fugitive",
    "git",
    "NvimTree",
    "Outline",
    "terminal",
    "nofile",
  },
}
