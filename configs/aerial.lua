local present, aerial = pcall(require, "aerial")

if not present then
  return
end

aerial.setup({
  layout = {
    max_width = { 30, 0.2 },
  },
})
