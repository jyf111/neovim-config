local present, guard = pcall(require, "guard")

if not present then
  return
end

local ft = require("guard.filetype")

ft("c,cpp"):fmt("clang-format")

ft("lua"):fmt("stylua")

-- Call setup() LAST!
guard.setup({
  -- the only options for the setup function
  fmt_on_save = false,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = false,
})
