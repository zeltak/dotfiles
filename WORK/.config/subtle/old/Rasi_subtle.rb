#
# This program can be distributed under the terms of the GNU GPL.
# See the file COPYING.
#
# $Id: .config/subtle/subtle.rb,v 390 2011/10/02 09:06:16 unexist $
#

require "socket"

# Contrib {{{
begin
  require "#{ENV["HOME"]}/bin/subtle-contrib/ruby/launcher.rb"
  require "#{ENV["HOME"]}/bin/subtle-contrib/ruby/selector.rb"

  Subtle::Contrib::Selector.font  = "xft:Envy Code R:pixelsize=13"
#  Subtle::Contrib::Selector.font  = "xft:Terminus2"
  Subtle::Contrib::Launcher.fonts = [
    "xft:Envy Code R:pixelsize=80",
    "xft:Envy Code R:pixelsize=13"
#     "xft:Terminus2:pixelsize=10"
  ]

  Subtle::Contrib::Launcher.browser_screen_num = 0
rescue LoadError
end # }}}

# Options {{{
set :step,      5
set :snap,      10
set :gravity,   :center
set :urgent,    false
set :resize,    false
set :tiling,    false
#set :separator, "∞"
# }}}


# Screens {{{
screen 1 do
  stipple false
  top     [:spacer, :mpd, :separator, :clock]
  bottom  [:title, :spacer, :layout, :views, :tray]
  view    0
end

# }}}

# Styles {{{
style :all do
  padding    2, 6, 2, 6
  background "#1a1a1a"
  font       "xft:Envy Code R:pixelsize=13"
end

style :separator do
  separator "//"
  foreground "#ff0000"
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

style :clients do
  active   "#7c7c72", 3
  inactive "#494948", 3
  margin   5
end

style :subtle do
  panel      "#1a1a1a"
#  background "#595959"
  stipple    "#595959"
end # }}}

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways
# to set a certain gravity, most convenient is to define a gravity via a tag or
# change them during runtime via grab. Subtler and subtlext can also modify
# gravities.
#
# A gravity consists of four values which are a percentage value of the screen
# size. The first two values are x and y starting at the center of the screen
# and he last two values are the width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   gravity :example, [ 0, 0, 100, 100 ]
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Gravity
#

# Top left
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]

# Top
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]

# Top right
gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  33 ]

# Left
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]

# Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  33,  33 ]

# Right
gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  67,  50,  33, 100 ]

# Bottom left
gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  67,  50,  33 ]

# Bottom
gravity :bottom,         [   0,  50, 100,  50 ], :horz
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]

# Bottom right
gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  67,  50,  33 ]

# Gimp
#gravity :gimp_image,     [  10,   0,  80, 100 ]
#gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
#gravity :gimp_dock,      [  90,   0,  10, 100 ]

# Pidgin
gravity :pidgin_buddylist,    [  80,  50,  20,  100 ]
gravity :pidgin_conv,         [ 0,  0,  80,  100 ]

# MPD
gravity :mpdtop,     [ 0, 0,  100, 55 ]
gravity :mpdbottom,  [ 0, 55, 100, 45 ], :horz

#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Finding keys
#
# The best resource for getting the correct key names is
# */usr/include/X11/keysymdef.h*, but to make life easier here are some hints
# about it:
#
# * Numbers and letters keep their names, so *a* is *a* and *0* is *0*
# * Keypad keys need *KP_* as prefix, so *KP_1* is *1* on the keypad
# * Strip the *XK_* from the key names if looked up in
#   /usr/include/X11/keysymdef.h
# * Keys usually have meaningful english names
# * Modifier keys have special meaning (Alt (A), Control (C), Meta (M),
#   Shift (S), Super (W))
#
# === Chaining
#
# Chains are a combination of keys and modifiers to one or a list of keys
# and can be used in various ways to trigger an action. In subtle, there are
# two ways to define chains for grabs:
#
#   1. *Default*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Chain*: Define a list of grabs that need to be pressed in order
#
#      *Example*: grab "C-y Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*]  = Button1 (Left mouse button)
# [*B2*]  = Button2 (Middle mouse button)
# [*B3*]  = Button3 (Right mouse button)
# [*B4*]  = Button4 (Mouse wheel up)
# [*B5*]  = Button5 (Mouse wheel down)
# [*...*]
# [*B20*] = Button20 (Are you sure that this is a mouse and not a keyboard?)
#
# ==== Modifiers
#
# [*A*] = Alt key (Mod1)
# [*C*] = Control key
# [*M*] = Meta key (Mod3)
# [*S*] = Shift key
# [*W*] = Super/Windows key (Mod4)
# [*G*] = Alt Gr (Mod5)
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#   grab "C-a c",    "urxvt"
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Grabs
#

# Jump to view1, view2, ...
grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4
grab "W-S-5", :ViewJump5
grab "W-S-6", :ViewJump6
grab "W-S-7", :ViewJump7
grab "W-S-8", :ViewJump8
grab "W-S-9", :ViewJump9

# Switch current view
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4
grab "W-5", :ViewSwitch5
grab "W-6", :ViewSwitch6
grab "W-7", :ViewSwitch7
grab "W-8", :ViewSwitch8
grab "W-9", :ViewSwitch9


# Select next and prev view */
grab "KP_Add",      :ViewNext
grab "KP_Subtract", :ViewPrev

# Move mouse to screen1, screen2, ...
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-S-r", :SubtleRestart

# Quit subtle
grab "W-C-q", :SubtleQuit

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "W-f", :WindowFloat

# Toggle fullscreen mode of window
grab "W-space", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "W-s", :WindowStick

# Toggle zaphod mode of window (will span across all screens)
grab "W-equal", :WindowZaphod

# Raise window
grab "W-r", :WindowRaise

# Lower window
grab "W-l", :WindowLower

# Select next windows
grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight

# Kill current window
grab "W-k", :WindowKill

# Cycle between given gravities
grab "W-KP_7", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-KP_8", [ :top,          :top66,          :top33          ]
grab "W-KP_9", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-KP_4", [ :left,         :left66,         :left33         ]
grab "W-KP_5", [ :center,       :center66,       :center33       ]
grab "W-KP_6", [ :right,        :right66,        :right33        ]
grab "W-KP_1", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-KP_2", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-KP_3", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# In case no numpad is available e.g. on notebooks
#grab "W-q", [ :top_left,     :top_left66,     :top_left33     ]
#grab "W-w", [ :top,          :top66,          :top33          ]
#grab "W-e", [ :top_right,    :top_right66,    :top_right33    ]
#grab "W-a", [ :left,         :left66,         :left33         ]
#grab "W-s", [ :center,       :center66,       :center33       ]
#grab "W-d", [ :right,        :right66,        :right33        ]
#
# QUERTZ
#grab "W-y", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
#
# QWERTY
#grab "W-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
#
#grab "W-x", [ :bottom,       :bottom66,       :bottom33       ]
#grab "W-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# Exec programs
grab "W-Return", "terminal --role=term"
grab "W-S-s", "terminal --role=ssh -e karif"
grab "W-p", "/usr/bin/dmenu_run -b -fn 'Envy Code R-10' -nf '#999' -nb '#000' -sf '#eee' -sb '#0077bb' -p 'run:'"
grab "W-S-n", "terminal --role=ncmpcpp -e ncmpcpp"
grab "W-S-r", "terminal --role=ranger -e ranger"
grab "W-S-l", "xlock"
grab "W-S-F12", "#{ENV["HOME"]}/bin/lastfm.sh"
grab "W-S-F11", "#{ENV["HOME"]}/bin/love"
grab "W-Insert", "/usr/lib/perl5/vendor_perl/bin/dmenuclip"
grab "W-C-Insert", "/usr/lib/perl5/vendor_perl/bin/dmenurl"
grab "Print", "#{ENV["HOME"]}/bin/scrotmenu.sh"
grab "W-S-m", "terminal --role=newsbeuter -e newsbeuter"
grab "XF86Mail", "terminal --role=mutt -e mutt"
grab "XF86HomePage", "firefox"
grab "XF86AudioPlay", "mpc toggle" 
grab "XF86AudioStop", "mpc stop"
grab "XF86AudioNext", "mpc next"
grab "XF86AudioPrev", "mpc prev"
grab "XF86AudioRaiseVolume", "mpc volume +1"
grab "XF86AudioLowerVolume", "mpc volume -1"
grab "XF86Back", "mpc seek -5"
grab "XF86Forward", "mpc seek +5"
grab "XF86Reload", "#{ENV["HOME"]}/bin/mpdscrobble"
grab "Cancel", "#{ENV["HOME"]}/bin/love"
grab "XF86Tools", "terminal --role=ncmpcpp -e ncmpcpp"
grab "W-S-Escape", "#{ENV["HOME"]}/bin/power.sh"
grab "W-S-F9", "#{ENV["HOME"]}/bin/dmenu_passes"
grab "W-S-F8", "#{ENV["HOME"]}/bin/mpd-dmenu -a"
grab "W-S-F7", "#{ENV["HOME"]}/bin/mpd-dmenu -j"

#Terminals
grab "W-S-KP_7", "terminal --role=top_left"
grab "W-S-KP_9", "terminal --role=top_right"
grab "W-S-KP_1", "terminal --role=bottom_left"
grab "W-S-KP_3", "terminal --role=bottom_right"
grab "W-S-KP_5", "terminal --role=center33"


# Contrib
grab "W-x" do
  Subtle::Contrib::Launcher.run
end

grab "W-z" do
  Subtle::Contrib::Selector.run
end

# Scratchpad
grab "W-y" do
  if (c = Subtlext::Client.first(role: "scratch"))
    c.toggle_stick
    c.focus
  elsif((c = Subtlext::Subtle.spawn("terminal --role=scratch")))
    c.tags  = []
    c.flags = [ :stick ]
  end
end


# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# === Simple
#
# The simple way just needs a name and a regular expression to just handle the
# placement:
#

# Example:
#
#  tag "terms", "terms"
#
# === Extended
#
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# Example:
#
#  tag "terms" do
#    match   "xterm|[u]?rxvt"
#    gravity :center
#  end
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the
# default view. The default view can either be set by the user with adding the
# default tag to a view by choice or otherwise the first defined view will be
# chosen automatically.
#
# === Properties
#
# [*borderless*] This property enables the borderless mode for tagged clients.
#
#                Example: borderless true
#                Links:    http://subforge.org/projects/subtle/wiki/Tagging#Borderless
#                          http://subforge.org/projects/subtle/wiki/Clients#Borderless
#
# [*fixed*]      This property enables the fixed mode for tagged clients.
#
#                Example: fixed true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fixed
#                         http://subforge.org/projects/subtle/wiki/Clients#Fixed
#
# [*float*]      This property enables the float mode for tagged clients.
#
#                Example: float true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Float
#                         http://subforge.org/projects/subtle/wiki/Clients#Float
#
# [*full*]       This property enables the fullscreen mode for tagged clients.
#
#                Example: full true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fullscreen
#                         http://subforge.org/projects/subtle/wiki/Clients#Fullscreen
#
# [*geometry*]   This property sets a certain geometry as well as floating mode
#                to the tagged client, but only on views that have this tag too.
#                It expects an array with x, y, width and height values whereas
#                width and height must be >0.
#
#                Example: geometry [100, 100, 50, 50]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Geometry
#
# [*gravity*]    This property sets a certain to gravity to the tagged client,
#                but only on views that have this tag too.
#
#                Example: gravity :center
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Gravity
#
# [*match*]      This property adds matching patterns to a tag, a tag can have
#                more than one. Matching works either via plaintext, regex
#                (see man regex(7)) or window id. Per default tags will only
#                match the WM_NAME and the WM_CLASS portion of a client, this
#                can be changed with following possible values:
#
#                [*:name*]      Match the WM_NAME
#                [*:instance*]  Match the first (instance) part from WM_CLASS
#                [*:class*]     Match the second (class) part from WM_CLASS
#                [*:role*]      Match the window role
#                [*:type*]      Match the window type
#
#                Examples: match instance: "urxvt"
#                          match [:role, :class] => "test"
#                          match "[xa]+term"
#                Link:     http://subforge.org/projects/subtle/wiki/Tagging#Match
#
# [*position*]   Similar to the geometry property, this property just sets the
#                x/y coordinates of the tagged client, but only on views that
#                have this tag, too. It expects an array with x and y values.
#
#                Example: position [ 10, 10 ]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Position
#
# [*resize*]     This property enables the float mode for tagged clients.
#
#                Example: resize true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Resize
#                         http://subforge.org/projects/subtle/wiki/Clients#Resize
#
# [*stick*]      This property enables the float mode for tagged clients.
#
#                Example: stick true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Stick
#
# [*type*]       This property sets the tagged client to be treated as a specific
#                window type though as the window sets the type itself. Following
#                types are possible:
#
#                [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Desktop
#                [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dock
#                [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Toolbar
#                [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Splash
#                [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dialog
#
#                Example: type :desktop
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Type
#
# [*urgent*]     This property enables the urgent mode for tagged clients.
#
#                Example: stick true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Urgent
#
# [*zaphod*]     This property enables the zaphod mode for tagged clients.
#
#                Example: zaphod true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Zaphod
#                         http://subforge.org/projects/subtle/wiki/Clients#Zaphod
#
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Tagging
#

# Simple tags
tag "terms" do 
  match "top_right|top_left|bottom_left|bottom_right|center33"
end

tag "browser", "uzbl|opera|firefox|navigator|chromium|Browser|Minefield|Navigator|<unknown>|gnome-mplayer|Exe|jumanji|dwb|<unknown>|plugin-container|exe|operapluginwrapper|npviewer.bin"

tag "ffdownload" do
    match "Download"
    float true
end

tag "media" do
    match "gmpc|spotify|rrip_gui" ;
    match :name => "MusicBrainz"
end

tag "pavucontrol" do
  match "pavucontrol"
  gravity :top_right
end

tag "mail" do
    match "Mail|Lanikai"
end

tag "DL", "jd.Main|transmission-qt|transmission-remote-gtk"

# Placement
tag "editor" do
  match  "[g]?vim"
  resize true
end

###Terminals###
tag "terminal" do
  match role: "term"
  gravity :center
end

tag "top_left" do
  match role: "top_left"
  gravity :top_left
end

tag "top_right" do
  match role: "top_right"
  gravity :top_right
end

tag "bottom_left" do
  match role: "bottom_left"
  gravity :bottom_left
end

tag "bottom_right" do
  match role: "bottom_right"
  gravity :bottom_right
end

tag "center33" do
  match role: "center33"
  gravity :center33
end

tag "spaceterm" do
  match role: "space"
  gravity :center33
end

tag "ncmpcpp" do
  match role: "ncmpcpp"
  gravity :mpdtop
end

tag "ssh" do
  match role: "ssh"
  gravity :top_left
end

tag "files" do
  match "thunar"
  match "spacefm"
end

tag "thunar" do
  match :name => "File.Operation.Progress"
  float true
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

tag "resize" do
  match  "sakura|gvim"
  resize true
end

# Modes
tag "stick" do
  match "mplayer|feh|mupdf|pinentry-gtk-2|pdfshuffler"
  float true
  stick true
  urgent true
end

 tag "borderless" do
   match       "chromium" 
   borderless  true
 end

tag "float" do
  match "awt|ccgo|mplayer"
  float true
end

# Pidgin
tag "conversations" do
  match  :role => "conversation"
  gravity :pidgin_conv
end

tag "buddylist" do
  match  :role => "buddy_list"
  gravity :pidgin_buddylist
end

tag "filetransfer" do
  match "Pidgin"
  match :role => "transfer"
  float true
end  

# Gimp
#tag "gimp_image" do
#
#  match   :role => "gimp-image-window"
#  gravity :gimp_image
#end

#tag "gimp_toolbox" do
#  match   :role => "gimp-toolbox$"
#  gravity :gimp_toolbox
#end

#tag "gimp_dock" do
#  match   :role => "gimp-dock"
#  gravity :gimp_dock
#end

tag "gfx" do
  match "gthumb|Gthumb|Shotwell|shotwell|digikam|Digikam"
end

tag "wine" do
  match "Wine"
  gravity :center
  float true
end

tag "gimp_splash" do
 match "Gimp"
end

tag "mpdstuff" do
  match role: "mpdstuff"
  gravity :mpdbottom
end


#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#

view "terms" do
  match "terms|ssh|top_left|top_right|bottom_left|bottom_right|center33|terminal";
#  icon "#{ENV["HOME"]}/.config/subtle/icons/arch.xbm"
  icon_only false
end

view "www" do
  match "browser"
#  icon "#{ENV["HOME"]}/.config/subtle/icons/fox.xbm"
  icon_only false
end

view "stuff" do
  match "files|thunar|TeamSpeak|spacefm|spaceterm"
#  icon "#{ENV["HOME"]}/.config/subtle/icons/dish.xbm"
  icon_only false
end

view "media" do
  match "media|ncmpcpp|pavucontrol|mpdstuff"
#  icon "#{ENV["HOME"]}/.config/subtle/icons/note.xbm"
  icon_only false
end

view "dl" do 
  match "DL"
#  icon "#{ENV["HOME"]}/.config/subtle/icons/net_down_02.xbm"
  icon_only false
end

view "gfx" do
  match "gimp_.*|gfx"
#  icon "#{ENV["HOME"]}/.config/subtle/icons/fs_01.xbm"
  icon_only false
end

view "mail" do
  match "mail|mail2|buddylist|conversations|filetransfer"
#  icon "#{ENV["HOME"]}/.config/subtle/icons/mail.xbm"
  icon_only false
end

view "notag" do
  match "default|kgs_room|float"
#  icon "#{ENV["HOME"]}/.config/subtle/icons/empty.xbm"
  icon_only false
end

#
# == Sublets
#
# Sublets are Ruby scripts that provide data for the panel and can be managed
# with the sur script that comes with subtle. Configuration of sublets can
# either be done inside of the sublet or when supported in the config.
#
# === Example
#
#  sublet :clock do
#    interval      30
#    format_string "%H:%M:%S"
#  end
#

#
# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event.
#
# Following hooks exist so far:
#
# [*:client_create*]    Called whenever a window is created
# [*:client_configure*] Called whenever a window is configured
# [*:client_focus*]     Called whenever a window gets focus
# [*:client_kill*]      Called whenever a window is killed
#
# [*:tag_create*]       Called whenever a tag is created
# [*:tag_kill*]         Called whenever a tag is killed
#
# [*:view_create*]      Called whenever a view is created
# [*:view_configure*]   Called whenever a view is configured
# [*:view_jump*]        Called whenever the view is switched
# [*:view_kill*]        Called whenever a view is killed
#
# [*:tile*]             Called on whenever tiling would be needed
# [*:reload*]           Called on reload
# [*:start*]            Called on start
# [*:exit*]             Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   on :client_focus do |c|
#     puts c.name
#   end
#
# === Link
#
# http://subforge.org/wiki/subtle/Hooks
on :start do
   # Create missing tags
   views = Subtlext::View.all.map { |v| v.name }
   tags  = Subtlext::Tag.all.map { |t| t.name }
 
   views.each do |v|
     unless(tags.include?(v))
       t = Subtlext::Tag.new(v)
       t.save
     end
   end
 end
 
 # Add nine C-< number> grabs
 (1..9).each do |i|
  grab "C-%d" % [ i ] do |c|
    views = Subtlext::View.all
    names = views.map { |v| v.name }
 
    # Sanity check
    if(i <= views.size)
      # Tag client
      tags = c.tags.reject { |t| names.include?(t.name) or "default" == t.name }
      tags << names[i - 1]
 
      c.tags = tags
 
      # Tag view
      views[i - 1].tag(names[i - 1])
    end
  end
 end
grab "A-Tab" do |c|
    sel     = 0
    clients = Subtlext::Client.visible
 
    clients.each_index do |idx|
      if(clients[idx].id == c.id)
        sel = idx + 1 if(idx < clients.size - 1)
      end
    end
 
   clients[sel].focus
 end

sublet :mpd do
 host "192.168.1.100@mpd_access"
 show_icons false
end

on :start do
   # Create missing tags
   views = Subtlext::View.all.map { |v| v.name }
   tags  = Subtlext::Tag.all.map { |t| t.name }
 
   views.each do |v|
     unless tags.include?(v)
       t = Subtlext::Tag.new(v)
       t.save
     end
   end
 end
 
 # Add nine C-< number> grabs
 (1..9).each do |i|
  grab "C-%d" % [ i ] do |c|
    views = Subtlext::View.all
    names = views.map { |v| v.name }
 
    # Sanity check
    if i <= views.size
      # Tag client
      tags = c.tags.reject { |t| names.include?(t.name) or "default" == t.name }
      tags << names[i - 1]
 
      c.tags = tags
 
      # Tag view
      views[i - 1].tag(names[i - 1])
    end
  end
 end

