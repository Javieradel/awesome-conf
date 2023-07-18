local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- WIDGETS IMPORTS
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local run_shell = require("awesome-wm-widgets.run-shell-3.run-shell")
-- temperature
termalWidget = awful.widget.watch(
        'cat /sys/class/thermal/thermal_zone0/temp', 1,
        function(widget, stdout)
          local temp = string.match(stdout, "(%d%d)%d%d%d")
          widget:set_text('  '.. temp .. "°C" .. "  ")
          if tonumber(temp) >= 65 then 
          naughty.notify({  preset = naughty.config.presets.normal,
                            title = "Higth Temp",
                            text = temp .. "°C",
                            bg="#323232"
            })
          end

          return
        end)
    

continuousWallpaper = '/home/altair/Descargas/imgs/wallpaper11.jpg'
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

--mytextclock2 = wibox.widget{
--  align  = 'center',
--  valign = 'center',
--  widget = wibox.widget.textbox,
--  markup = '123123',
--  font	 =beautiful.font_to_clock --Set a textbox' font
--  --text	Set a textbox' text.
--  --ellipsize	Set a textbox' ellipsize mode.
--  --wrap	Set a textbox' wrap mode.
--  --valign	The textbox' vertical alignment
--  --align	Set a textbox' horizontal alignment.
--  --forced_height	Force a widget height.
--  --forced_width	Force a widget width.
--  --opacity	The widget opacity (transparency).
--  --visible
--}

mytextclock = wibox.widget.textclock("  %H:%M  ")
mytextclock.font = beautiful.font_to_clock
local cw = calendar_widget({
    theme = 'dark',
    placement = 'bottom_right',
    radius = 8,
})

--Wibar
-- Create a textclock widget

mytextclock:connect_signal("button::press",
  function(_, _, _, button)
    if button == 1 then cw.toggle() end
  end
)
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button(
    { },
    1,
    function(t)
      t:view_only()
    end
  ),
  awful.button(
    { modkey },
    1,
    function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end
  ),
  awful.button(
    { },
    3,
    awful.tag.viewtoggle
  ),
  awful.button(
    { modkey },
    3,
    function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end
  ),
  awful.button(
    { },
    4,
    function(t)
      awful.tag.viewnext(t.screen)
    end),
  awful.button(
    { },
    5,
    function(t)
      awful.tag.viewprev(t.screen)
    end
  )
)

local tasklist_buttons = gears.table.join(
  awful.button(
    { },
    1,
    function (c)
      if c == client.focus then
          c.minimized = true
      else
          c:emit_signal(
              "request::activate",
              "tasklist",
              {raise = true}
          )
      end
    end
  ),
  awful.button(
    { },
    3,
    function()
      awful.menu.client_list({ theme = { width = 250 } })
    end
  ),
  awful.button(
    { },
    4,
    function ()
      awful.client.focus.byidx(1)
    end
  ),
  awful.button(
    { },
    5,
    function ()
      awful.client.focus.byidx(-1)
    end
  )
)
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
--beautiful.wallpaper ="/home/altair/Descargas/tenor.gif"
beautiful.get().font="sans 8"
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- APPLY TO ALL SCREENS
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
awful.screen.connect_for_each_screen(
  function(s)
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Wallpaper
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    beautiful.wallpaper= continuousWallpaper
    set_wallpaper(s)

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Wibox Tags
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    s.wiboxModKeyW = wibox {
          bg  = beautiful.bg_normal .. "00",
          --border_color = '#00ff00',
          --border_width = 2,
          --placement    = awful.placement.top_left,
          --shape        = gears.shape.rounded_rect,
          visible      = false,
          ontop        = true,
          width        = 295,
          height       = 54,
          shape        = gears.shape.rounded_rect,
          --x = 0,
          --y = 250,
          screen = s
      }

      awful.placement.centered(s.wiboxModKeyW)

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- TAG LIST
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    s.mytaglist = awful.widget.taglist {
      screen  = s,
      filter  = awful.widget.taglist.filter.all,
      layout  = wibox.layout.fixed.horizontal,
      buttons = taglist_buttons,
      bg      = beautiful.bg_normal .. '00',
    }
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- LAYOUT BOX
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(
        gears.table.join(
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc( 1) end),
            awful.button({ }, 5, function () awful.layout.inc(-1) end)
        )
  )
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- TAG LIST
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
      screen  = s,
      filter  = awful.widget.taglist.filter.all,
      layout  = wibox.layout.fixed.horizontal,
      buttons = taglist_buttons,
      bg      = beautiful.bg_normal .. '00',
    }
    s.wiboxModKeyW: setup {
      widget = s.mytaglist
    }

    s.mytasklist = awful.widget.tasklist {
      screen  = s,
      filter  = awful.widget.tasklist.filter.currenttags,
      buttons = tasklist_buttons
    }
    
    s.mywibox = awful.wibar({ position = "bottom", screen = s, visible = false })
  end
)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- APPLY EACH SCREEN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  --  WIDGETS CONF
    
awful.screen.connect_for_each_screen(function(s)
        local ram_widget_conf = {
          timeout = 15,
          widget_show_buf= true,
          color_buf="#663232"
        }
        local cpu_widget_conf = {
          width = 30,
          step_width = 2,
          step_spacing = 1,
          color = '#33d1d6',
          timeout = 1
      }
        awful.tag.add(" ", {
            --icon               = "/home/altair/Imagenes/globe2.svg",
            layout             = awful.layout.layouts[5],
            --master_fill_policy = "master_width_factor",
            gap_single_client  = true,
            --gap                = 15,
            screen             = s,
            selected           = true,
        })
        awful.tag.add(" ", {
            --icon               = "/path/to/icon1.png",
            layout             = awful.layout.layouts[5],

            --master_fill_policy = "master_width_factor",
            --gap_single_client  = true,
            --gap                = 15,
            screen             = s,
            selected           = false,
        })
        awful.tag.add(" ", {
            --icon               = "/path/to/icon1.png",
            layout             = awful.layout.layouts[5],

            --master_fill_policy = "master_width_factor",
            --gap_single_client  = true,
            --gap                = 15,
            screen             = s,
            selected           = false,
        })
        awful.tag.add(" ", {
            --icon               = "/path/to/icon1.png",
            layout             = awful.layout.layouts[5],

            --master_fill_policy = "master_width_factor",
            --gap_single_client  = true,
            --gap                = 15,
            screen             = s,
            selected           = false,
            
        })
        
        s.mywiboxTop = awful.wibar({ position = "top", screen = s, visible = false })
        s.mywiboxTop:setup {
            visible = true,
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                termalWidget,
            },
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                mytextclock,
                mytextclock2,
                ram_widget(ram_widget_conf),
                cpu_widget(cpu_widget_conf),
                net_speed_widget(),
                logout_menu_widget()
            },
        }
      local volume_widget_conf ={ widget_type = 'arc' }

      s.mywiboxBotom = awful.wibar({ position = "bottom", screen = s, visible = false })
      s.mywiboxBotom:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
        },
        s.mytasklist, -- Middle widget
        { 
        -- Right widgets
          layout = wibox.layout.fixed.horizontal,
          wibox.widget.systray(),
          volume_widget(volume_widget_conf),
          s.mylayoutbox,
        },
      }
  end
)