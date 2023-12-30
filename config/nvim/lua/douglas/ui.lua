local noice_status, noice = pcall(require, "noice")

if not noice_status then
  return
end

local notify_status, notify = pcall(require, "notify")

if not notify_status then
  return
end

noice.setup({})

notify.setup({
  background_colour = "#000000"
})

