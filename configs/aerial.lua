local present, aerial = pcall(require, "aerial")

if not present then
  return
end

aerial.setup({
  backends = { "treesitter", "lsp", "markdown", "man" },
  layout = {
    max_width = { 40, 0.2 },
    width = nil,
    min_width = 10,
  },
  default_direction = "prefer_right",
})
