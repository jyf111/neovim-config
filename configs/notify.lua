local present, notify = pcall(require, "notify")

if not present then
  return
end

notify.setup({
  background_colour = "NotifyBackground",
  fps = 20,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade_in_slide_out",
  timeout = 2000,
  top_down = true,
})
