-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
--pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- vicious
--
--vicious =require("vicious")

--COMPOSITOR
-- awful.util.spawn("compton")
--
-- awful.util.spawn("picom")

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                    title = "Oops, there were errors during startup!",
                    text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), 'default'))
--beautiful.init(gears.filesystem.get_themes_dir() .. "gtk/theme.lua")
--beautiful.init(dofile("./theme/gtk/theme.lua"))

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor


-- Def
-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
    -- awful.layout.suit.spiral,
    awful.layout.suit.tile,
    awful.layout.suit.max,
    awful.layout.suit.magnifier,
    --awful.layout.suit.fair,
    awful.layout.suit.floating,
    --awful.layout.suit.fair.horizontal,
}
-- }}}
-- {{{ Menu
-- Create a launcher widget and a main menu

myawesomemenu = {
    --{ "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    --{ "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    --{ "quit", function() awesome.quit() end },
}

--mymainmenu = awful.menu( {items = it} )

    mymainmenu = awful.menu({ items = { 
        { "open terminal", terminal },
        --{ "Code Marfix", terminal .. " -e code" .. currentWorkMarfix },
        { "awesome", myawesomemenu, beautiful.awesome_icon },
    }
})
 
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                        menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
--mykeyboardlayout = awful.widget.keyboardlayout()
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- TAGS CONFIG
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --



-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- - -- -- SCREEN CONF
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
dofile(awful.util.getdir("config") .. "/" .. "./screens-conf.lua")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- - -- -- KEY BINDINGS
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
dofile(awful.util.getdir("config") .. "/" .. "./keys-shorcuts.lua")
    -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- --
    -- MOUSE BINDINGS
    -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- --
    root.buttons(gears.table.join(
        awful.button({ }, 3, function () mymainmenu:toggle() end),
        awful.button({ }, 4, awful.tag.viewnext),
        awful.button({ }, 5, awful.tag.viewprev)
    ))
    -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- --
    -- SET KEYS
    -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- -- -- -- -- -- -- --
    root.keys(globalkeys)

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- RULES
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
dofile(awful.util.getdir("config") .. "/" .. "./rules.lua")

-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        --bg_normal = '#323232' .. "00" ,
        --bg_focus = '#ff0000',
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            --awful.titlebar.widget.stickybutton   (c),
            --awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- run garbage collector
--
  gears.timer {
        timeout = 30,
        autostart = true,
        callback = function() collectgarbage() end
  }
-- run garbage collector
--
--[[ descanso = gears.timer {
    timeout = 1800,
    autostart = true,
    callback = function(this)

        naughty.notify({
            timeout= 4,
            width= 1600,    
            preset = naughty.config.presets.normal,
            title = "TOMATE UN DESCANSO",
            text = 'Han Pasado 30Min',
            bg= "#f2f542",
            fg= "#000",
            position="bottom_right",
            run= function(this)
                this.die()
            end    
        })
        this.again()
   end
} ]]

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

awful.util.spawn("/home/altair/.screenlayout/dualMonTv.sh")
awful.util.spawn("setxkbmap us -variant altgr-intl")


dofile(awful.util.getdir("config") .. "/" .. "./test-widgets.lua")