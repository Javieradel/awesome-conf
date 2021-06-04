
-- {{{ Mem Usage
  -- Icon
  ramicon = widget({type = "imagebox" })
  ramicon.image = image(beautiful.widget_mem)
  ramicon.resize = false
  awful.widget.layout.margins[ramicon] = { top = 3 }
-- Percentage
  mempct = widget({ type= "textbox", align = "right"})
  vicious.register(mempct, vicious.widgets.mem, "$1%", 13)
-- Meter
  membar = awful.widget.progressbar()
  membar:set_width(45)
  membar:set_height(9)
  membar:set_vertical(false)
  membar:set_background_color("#3F3F3F")
  membar:set_color("#ff6565" )
  vicious.register(membar, vicious.widgets.mem, "$1", 13)
-- Megs used
  memwidget = widget({ type= "textbox", align = "left"})
  vicious.register(memwidget, vicious.widgets.mem, "$2Mb", 5)
-- Align progressbar
  awful.widget.layout.margins[membar.widget] = { top = 4 }
-- Cache that shit
  vicious.cache(vicious.widgets.mem)
--- }}}