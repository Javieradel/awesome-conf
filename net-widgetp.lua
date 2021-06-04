--- {{{ Network usage widget
  -- icons
  neticonup = widget({type = "imagebox" })
  neticonup.image = image(beautiful.widget_net_up)
  neticonup.resize = false
  awful.widget.layout.margins[neticonup] = { top = 3 }
  neticondown = widget({type = "imagebox" })
  neticondown.image = image(beautiful.widget_net_down)
  neticondown.resize = false
  awful.widget.layout.margins[neticondown] = { top = 3 }
-- Initialize widget
  netwidgetup = widget({ type = "textbox" })
  vicious.register(netwidgetup, vicious.widgets.net, '<span color="#7F9F7F">${eth0 up_kb}</span>', 3)
  netwidgetdown = widget({ type = "textbox" })
  vicious.register(netwidgetdown, vicious.widgets.net, '<span color="#CC9393">${eth0 down_kb}</span>', 3)
--- }}}