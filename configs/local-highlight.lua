local present, local_highlight = pcall(require, "local-highlight")

if not present then
  return
end

local_highlight.setup {
  file_types = {
    'cpp',
    'go',
    'lua',
    'python',
    'rust',
  }, -- If this is given only attach to this
  -- OR attach to every filetype except:
  disable_file_types = {'tex'},
  hlgroup = 'Search',
  cw_hlgroup = nil,
}
