# -*- encoding: utf-8 -*-
#
# This program can be distributed under the terms of the GNU GPL.
# See the file COPYING.
#
# $Id: .config/subtle/subtle.rb,v 426 2012/05/23 00:03:48 unexist $
#

require "socket"

# Contrib {{{
begin
  require "#{ENV["HOME"]}/projects/subtle-contrib/ruby/launcher.rb"
  require "#{ENV["HOME"]}/projects/subtle-contrib/ruby/selector.rb"

  Subtle::Contrib::Selector.font  = "xft:Envy Code R:pixelsize=13"
  Subtle::Contrib::Launcher.fonts = [
    "xft:Envy Code R:pixelsize=80",
    "xft:Envy Code R:pixelsize=13"
  ]

  Subtle::Contrib::Launcher.browser_screen_num = 0
rescue LoadError
end # }}}

# Options {{{
set :increase_step,     5
set :border_snap,       10
set :default_gravity,   :center
set :urgent_dialogs,    false
set :honor_size_hints,  false
set :gravity_tiling,    false
#set :click_to_focus,    false
set :skip_pointer_warp, false
# }}}

# Screens {{{
screen 1 do
  top     [:title, :spacer, :views, :center, :clock, :separator, :cpu, :sublets, :center]
  bottom  []
  view    0
end

screen 2 do
  top     [:mpd, :separator, :volume, :spacer, :title, :tray, :center, :views, :center]
  bottom  []
  view    5
end

screen 3 do
  top     [:views, :spacer, :title, :center, :wifi, :jdownloader, :center]
  bottom  []
  view    1
end
# }}}

# Styles {{{
style :all do
  padding    2, 6, 2, 6
  background "#1a1a1a"
  font       "xft:Envy Code R:pixelsize=13"
end

style :title do
  foreground "#FFFFFF"
end

style :views do
  foreground "#7c7c72"
  icon       "#7c7c72"

  style :focus do
    foreground    "#ffffff"
    icon          "#ffffff"
    border_bottom "#acaa53", 2
  end

  style :occupied do
    foreground    "#7c7c72"
    border_bottom "#949269", 2
  end

  style :urgent do
    foreground "#c0bd5c"
    icon       "#c0bd5c"
  end

  style :visible do
    padding_top 0
    border_top  "#494948", 2
  end
end

style :sublets do
  foreground "#7c7c72"
  icon       "#7c7c72"
end

style :separator do
  foreground "#acaa53"
  separator  "∞"
end

style :clients do
  active   "#7c7c72", 2
  inactive "#494948", 2
  margin   2
end

style :subtle do
  panel      "#1a1a1a"
  background "#595959"
  stipple    "#595959"
end
# }}}

# Gravities {{{
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]

gravity :top,            [   0,   0, 100,  50 ]
gravity :top75,          [   0,   0, 100,  75 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]

gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  33 ]

gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]

gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  33,  33 ]

gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  67,   0,  33, 100 ]

gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  67,  50,  33 ]
gravity :bottom_left25,  [   0,  75,  50,  25 ]

gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]

gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  67,  50,  33 ]
gravity :bottom_right25, [  50,  75,  50,  25 ]

gravity :gimp_image,     [  10,   0,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [  90,   0,  10, 100 ]

gravity :dia_toolbox,    [   0,   0,  15, 100 ]
gravity :dia_diagram,    [  15,   0,  85, 100 ]
# }}}

# Grabs {{{
# Host specific
host     = Socket.gethostname
modkey   = "W"
gravkeys = [ "KP_7", "KP_8", "KP_9", "KP_4", "KP_5", "KP_6", "KP_1", "KP_2", "KP_3" ]

if "telas" == host or "mockra" == host #< Netbooks
  gravkeys = [ "q", "w", "e", "a", "s", "d", "y", "x", "c" ]
elsif "test" == host #< Usually VMs
  modkey = "A"
end

# Views and screens
(1..6).each do |i|
  grab modkey + "-#{i}",   "ViewSwitch#{i}".to_sym
  grab modkey + "-S-#{i}", "ViewJump#{i}".to_sym
  grab modkey + "-F#{i}",  "ScreenJump#{i}".to_sym
end

# Windows
grab modkey + "-B1",      :WindowMove
grab modkey + "-B3",      :WindowResize
grab modkey + "-S-f",     :WindowFloat
grab modkey + "-S-space", :WindowFull
grab modkey + "-S-s",     :WindowStick
grab modkey + "-S-equal", :WindowZaphod
grab modkey + "-S-r",     :WindowRaise
grab modkey + "-S-l",     :WindowLower
grab modkey + "-S-k",     :WindowKill
grab modkey + "-S-h", lambda { |c| c.retag }

# Movement
{
 WindowLeft: [ "Left", "h" ], WindowDown:  [ "Down",  "j" ],
 WindowUp:   [ "Up",   "k" ], WindowRight: [ "Right", "l" ]
}.each do |k, v|
  grab "%s-%s" % [ modkey, v.first ], k
  grab "%s-%s" % [ modkey, v.last  ], k
end

# Reload/restart
grab modkey + "-C-q",     :SubtleQuit
grab modkey + "-C-r",     :SubtleReload
grab modkey + "-C-A-r",   :SubtleRestart

# Gravity keys and focus
gravities = [
  [:top_left, :top_left33, :top_left66],
  [:top, :top33, :top66, :top75],
  [:top_right, :top_right33, :top_right66],
  [:left, :left33, :left66],
  [:center, :center33, :center66],
  [:right, :right33, :right66],
  [:bottom_left, :bottom_left25, :bottom_left33, :bottom_left66],
  [:bottom, :bottom33, :bottom66],
  [:bottom_right, :bottom_right25, :bottom_right33, :bottom_right66]
]

gravities.each_index do |i|
  # Set gravities
  grab "%s-%s" % [ modkey, gravkeys[i] ], gravities[i]

  # Focus client with gravity
  grab "%s-C-%s" % [ modkey, gravkeys[i] ], lambda { |cur|
    idx     = 0
    clients = Subtlext::Client.visible.select { |c|
      gravities[i].include?(c.gravity.name.to_sym)
    }

    # Cycle through clients with same gravity
    if clients.include?(cur)
      idx = clients.index(cur) + 1
      idx = 0 if idx >= clients.size
    end

    clients[idx].focus
  }
end

# Multimedia keys
grab "XF86AudioMute",        :VolumeToggle
grab "XF86AudioRaiseVolume", :VolumeRaise
grab "XF86AudioLowerVolume", :VolumeLower
grab "XF86AudioPlay",        :MpdToggle
grab "XF86AudioStop",        :MpdStop
grab "XF86AudioNext",        :MpdNext
grab "XF86AudioPrev",        :MpdPrevious

grab modkey + "-m", "mpc current | tr -d '\n' | xclip"

# Programs
grab modkey + "-Return", "urxvt"
grab modkey + "-g", "gvim"
grab modkey + "-f", "firefox -no-remote -profileManager"
grab modkey + "-c", "chromium"

# Contrib
grab "W-x" do
  Subtle::Contrib::Launcher.run
end

grab "W-z" do
  Subtle::Contrib::Selector.run
end

# Scratchpad
grab "W-y" do
  if (c = Subtlext::Client.first("scratch"))
    c.toggle_stick
    c.focus
  elsif (c = Subtlext::Subtle.spawn("urxvt -name scratch"))
    c.tags  = []
    c.flags = [ :stick ]
  end
end

# Pychrom
grab modkey + "-p" do
  if (t = Subtlext::Tray[:pychrom])
    t.click
  else
    Subtlext::Subtle.spawn("pychrom")
  end
end

# Tabbing
grab modkey + "-Tab" do
  Subtlext::Client.recent[1].focus
end

# Set layout
grab modkey + "-numbersign" do
  # Find stuff
  view   = Subtlext::View.current
  tag    = view.tags.first
  client = view.clients.first
  urxvt1 = Subtlext::Client['urxvt1']
  urxvt2 = Subtlext::Client['urxvt2']

  # Update tags
  urxvt1 + tag
  urxvt2 + tag

  # Update gravities
  sym = view.name.to_sym
  client.gravity = { sym => :top75 }
  urxvt1.gravity = { sym => :bottom_right25 }
  urxvt2.gravity = { sym => :bottom_left25 }
end
# }}}

# Tags {{{
tag "terms" do
  match    instance: "xterm|urxvt"
  gravity  :center
  resize   true
end

tag "browser" do
  match "navigator|(google\-)?chrom[e|ium]|firefox|dwb"

  if "mockra" == host or "proteus" == host
    gravity :top75
  else
    gravity :center
  end
end

tag "editor" do
  match  "[g]?vim|eclipse"
  resize true

  if "mockra" == host or "proteus" == host
    gravity :top75
  else
    gravity :center
  end
end

tag "xeph640" do
  match    "xeph640"
  position [ 82, 549 ]
end

tag "xeph800" do
  match    "xeph800"
  position [ 855, 172 ]
end

tag "android" do
  match "SDL_App"
end

tag "mplayer" do
  match   "mplayer"
  float   true
  stick   1
end

tag "stick" do
  match  "dialog|subtly|python|gtk.rb|display|pychrom|skype|xev|evince|exe|<unknown>|plugin-container"
  stick  true
  float  true
end

tag "urgent" do
  stick  true
  urgent true
  float  true
end

tag "powerfolder" do
  match "de-dal33t-powerfolder-PowerFolder"
  float true
  stick true
end

tag "dialogs" do
  match  "sun-awt-X11-XDialogPeer"
  match type: [ :dialog, :splash ]
  stick true
end

tag "three" do
  match    "urxvt2"
  gravity  :bottom_right
end

tag "three25" do
  match    "urxvt2"
  gravity  :bottom_right25
end

tag "two" do
  match    "urxvt2"
  gravity  :bottom
end

tag "three25" do
  match    "urxvt1"
  gravity  :bottom_right25
end

tag "seven" do
  match    "urxvt1"
  gravity  :top_left
end

tag "eight" do
  match    "urxvt1"
  gravity  :top
end

tag "gimp" do
  match role: "gimp.*"

  on_match do |c|
    c.gravity = ("gimp_" + c.role.split("-")[1]).to_sym
  end
end

tag "dia" do
  match "dia"

  on_match do |c|
    c.gravity = ("dia_" + c.role.split("_").first).to_sym
  end
end

tag "inkscape" do
  match "inkscape"
end
# }}}

# Views {{{
if "mockra" == host or "proteus" == host
  www_re    = "browser|three25|three25"
  test_re   = "xeph[0-9]+|three25"
  editor_re = "editor|three25|three25"
  icons     = true
else
  www_re    = "browser"
  test_re   = "xeph[0-9]+|eight|three$|test"
  editor_re = "editor"
  icons     = true
end

iconpath = "#{ENV["HOME"]}/MLT/xbm"

space = {
  :cannon  => Subtlext::Icon.new("#{iconpath}/info.xbm"),
  :ufo     => Subtlext::Icon.new("#{iconpath}/info.xbm"),
  :shelter => Subtlext::Icon.new("#{iconpath}/info.xbm"),
  :terms   => Subtlext::Icon.new("#{iconpath}/info.xbm"),
  :www     => Subtlext::Icon.new("#{iconpath}/info.xbm"),
  :void    => Subtlext::Icon.new("#{iconpath}/info.xbm"),
  :sketch  => Subtlext::Icon.new("#{iconpath}/info.xbm"),
  :test    => Subtlext::Icon.new("#{iconpath}/info.xbm"),
  :editor  => Subtlext::Icon.new("#{iconpath}/info.xbm")
}

view "terms" do
  match     "terms|eight|two"
  #icon      "#{iconpath}/terminal.xbm"
  icon_only icons
end

view "www" do
  match     www_re
  #icon      "#{iconpath}/world.xbm"
  icon_only icons
end

view "void" do
  match     "default|void|powerfolder|pms"
  #icon      "#{iconpath}/quote.xbm"
  icon_only icons
end

view "sketch" do
  match     "inkscape|dia|gimp|android"
  #icon      "#{iconpath}/paint.xbm"
  icon_only icons
end

view "test" do
  match     test_re
  #icon      "#{iconpath}/bug.xbm"
  icon_only icons
end

view "editor" do
  match     editor_re
  #icon      "#{iconpath}/ruby.xbm"
  icon_only icons
end

on :view_focus do |v|
  views = Hash[*Subtlext::Screen.all.map { |s|
    [ s.view.name.to_sym, space[space.keys[s.id]] ] }.flatten
  ]

  Subtlext::View.all.each do |va|
    sym = va.name.to_sym

    if views.keys.include?(sym)
      va.icon.copy_area(views[sym])
    else
      va.icon.copy_area(space[va.name.to_sym])
    end
  end

  Subtlext::Subtle.render
end
# }}}

# Sublets {{{
sublet :clock do
  format_string "%a %b %d,"
end
# }}}


 on :start do
   Subtlext::Subtle.spawn "kupfer" 
 end
 
 on :start do
   Subtiext::Subtle.spawn "xbindkeys" 
 end
