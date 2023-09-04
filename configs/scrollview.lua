local present, scrollview = pcall(require, "scrollview")

if not present then
  return
end

scrollview.setup({
  excluded_filetypes = { "NvimTree", "terminal", "nofile", "Outline" },
  current_only = true,
  signs_on_startup = { "diagnostics", "folds", "marks", "search", "spell" },
})
