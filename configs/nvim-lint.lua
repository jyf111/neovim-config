local present, lint = pcall(require, "lint")

if not present then
  return
end

lint.linters_by_ft = {
  c = { "clangtidy" },
  cpp = { "clangtidy" },
  lua = { "luacheck" },
  sh = { "shellcheck"},
}
