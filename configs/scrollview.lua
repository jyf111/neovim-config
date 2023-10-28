local present, scrollview = pcall(require, "scrollview")

if not present then
  return
end

scrollview.setup({
  scrollview_mode = "virtual",
  excluded_filetypes = { "NvimTree", "terminal", "nofile", "Outline" },
  winblend = 0,
  current_only = true,
  signs_on_startup = { "diagnostics", "folds", "marks", "search", "spell" },
})
