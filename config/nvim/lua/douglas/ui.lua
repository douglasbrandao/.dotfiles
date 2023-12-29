local noice_status, noice = pcall(require, "noice")

if not noice_status then
  return
end

noice.setup({})

local notify_status, notify = pcall(require, "notify")

if not notify_status then
  return
end

notify.setup({
  background_colour = "#000000"
})

