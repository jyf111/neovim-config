local present, autotag = pcall(require, "nvim-ts-autotag")

if not present then
  return
end

autotag.setup({
  filetypes = {
    "html",
    "javascript",
    "xml",
    "markdown",
  },
})
