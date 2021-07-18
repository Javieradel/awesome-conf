
--local todo_widget = require("awesome-wm-widgets.todo-widget.todo")
-- temperature

termalWidget = awful.widget.watch(
    'cat /sys/class/thermal/thermal_zone0/temp', 1,
    function(widget, stdout)
      local temp = string.match(stdout, "(%d%d)%d%d%d")
      widget:set_text('  '.. temp .. "°C" .. "  ")
      
      if tonumber(temp) >= 65 then 
        naughty.notify({ preset = naughty.config.presets.critical,
        title = "Higth Temp",
        text = temp .. "°C" })
      end

      return
    end
    )

--    left = 8,
--    right = 8,
--    widget = wibox.container.margin

