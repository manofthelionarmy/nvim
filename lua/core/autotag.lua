local status_ok, autotag = pcall(require, 'nvim-ts-autotag')
if not status_ok then
    return
else
  print("loaded autotag")
  autotag.setup()
end
