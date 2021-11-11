---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "HackNerdFont 8"
active= '#24abc5'
font_to_tags= "HackNerdFont 8"
--theme.bg_normal     = "#222222"
theme.bg_normal     = "#000000"
--theme.bg_focus      = "#535d6c"
theme.bg_focus      = "#2a2a2a"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#000000"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#000000"
theme.border_focus  = active
theme.border_marked = "#91231c"

theme.taglist_font  = font_to_tags
theme.taglist_spacing = dpi(8)
theme.taglist_fg_focus = active
-- theme.tag.master_width_factor = 2
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

---------------------------------------
---------------------------------------
---------------------------------------
-- TAG LIST THEME
---------------------------------------
---------------------------------------
---------------------------------------
------------------------------
------------------------------
------------------------------
-- Backgrounds
------------------------------
------------------------------
------------------------------
    theme.taglist_bg_occupied	=   -- The tag list occupied elements background color.
    theme.taglist_bg_focus	    =   -- The tag list main background color.
    theme.taglist_bg_urgent	    =   -- The tag list urgent elements background color.
    theme.taglist_bg_empty	    =   -- The tag list empty elements background color.
    theme.taglist_bg_volatile	=   -- The tag list volatile elements background color.

------------------------------
------------------------------
------------------------------
--- FONT
------------------------------
------------------------------
------------------------------

    theme.taglist_font	        =   -- The taglist font.
    theme.taglist_fg_focus	    =   -- The tag list main foreground (text) color.
    theme.taglist_fg_urgent	    =   -- The tag list urgent elements foreground (text) color.
    theme.taglist_fg_occupied	=   -- The tag list occupied elements foreground (text) color.
    theme.taglist_fg_empty	    =   -- The tag list empty elements foreground (text) color.
    theme.taglist_fg_volatile	=   -- The tag list volatile elements foreground (text) color.

------------------------------
------------------------------
------------------------------
--- SQUARES
------------------------------
------------------------------
------------------------------
theme.taglist_squares_sel	              =   -- The selected elements background image.
theme.taglist_squares_unsel	              =   -- The unselected elements background image.
theme.taglist_squares_sel_empty	          =   -- The selected empty elements background image.
theme.taglist_squares_unsel_empty	      =   -- The unselected empty elements background image.
theme.taglist_squares_resize              =   -- 	If the background images can be resized.

------------------------------
------------------------------
------------------------------
--- UTILS
------------------------------
------------------------------
------------------------------
theme.taglist_disable_icon                =   --   	Do not display the tag icons, even if they are set.
theme.taglist_spacing	                  =   -- The space between the taglist elements.

------------------------------
------------------------------
------------------------------
--- SHAPE
------------------------------
------------------------------
------------------------------
theme.taglist_shape	                      =   -- The main shape used for the elements.
theme.taglist_shape_border_width	      =   -- The shape elements border width.
theme.taglist_shape_border_color	      =   -- The elements shape border color.
theme.taglist_shape_empty	              =   -- The shape used for the empty elements.
theme.taglist_shape_border_width_empty	  =   -- The shape used for the empty elements border width.
theme.taglist_shape_border_color_empty	  =   -- The empty elements shape border color.
theme.taglist_shape_focus	              =   -- The shape used for the selected elements.
theme.taglist_shape_border_width_focus	  =   -- The shape used for the selected elements border width.
theme.taglist_shape_border_color_focus	  =   -- The selected elements shape border color.
theme.taglist_shape_urgent	              =   -- The shape used for the urgent elements.
theme.taglist_shape_border_width_urgent	  =   -- The shape used for the urgent elements border width.
theme.taglist_shape_border_color_urgent	  =   -- The urgents elements shape border color.
theme.taglist_shape_volatile	          =   -- The shape used for the volatile elements.
theme.taglist_shape_border_width_volatile =   -- The shape used for the volatile elements border width.
theme.taglist_shape_border_color_volatile =   -- The volatile elements shape border color.
--------------------------------------
---------------------------------------
---------------------------------------


---------------------------------------
---------------------------------------
---------------------------------------
-- WIBOX GEN THEME
---------------------------------------
---------------------------------------
---------------------------------------
theme.wibar_height = dpi(16)
-- theme.wibar_type = 
-- theme.wibar_width
theme.wibar_opacity = 0
theme.wibar_bg = "#00000000"
-- theme.wibar_bgimage = "surface"
theme.wibar_fg = "#a0a0a0"
-- theme.wibar_shape = "gears.shape"
-- theme.bg_normal
-- theme.wibar_fg_normal
-- theme.wibar_cursor
theme.wibar_ontop = true

---------------------------------------
---------------------------------------
---------------------------------------

-- Generate taglist squares:
local taglist_square_size = dpi(6)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_urgent
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path.."default/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
