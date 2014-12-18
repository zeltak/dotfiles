###General


# Border size in pixel of the windows
set :border, 0

# Window move/resize steps in pixel per keypress
set :step, 5

# Window screen border snapping
set :snap, 10

# Default starting gravity for windows (0 = gravity of last client)
set :gravity, :center

# Make transient windows urgent
set :urgent, false

# Enable respecting of size hints globally-allow Clients to tell the wm some preferences about sizes
set :resize, false

set :padding, [0, 0, 0, 0] # Screen size padding (left, right, top, bottom)
set :strut, [0, 0, 0, 0]   #reserve screenspace for e.g. additional panels, leave at 0,0,0,0 if not requeired

# Space around windows
set :gap, 0
# Separator between sublets
set :separator, "|"
# Outline border size in pixel of panel items
set :outline, 1

#set :showmode


# Font string either take from e.g. xfontsel or use xft
#set :font, "-*-profont-*-*-*-*-13-*-*-*-*-*-*-*"
#set :font,       "xft:Envy Code R:pixelsize=13:bold:antialias=true"
set :font,       "xft:Envy Code R:pixelsize=13:antialias=true"
#set :font,       "xft:terminus:pixelsize=15:bold"
#set :font, "xft:monospace-10"
#set  :font, "xft:DejaVu Sans Mono:pixelsize=12:bold:antialias=true"
#set :font,       "xft:Verdana:pixelsize=11:bold"

# == Screen
#
# Generally subtle comes with two panels per screen, one on the top and one at
# the bottom. Each panel can be configured with different panel items and sublets
# screen wise. Per default only the top panel on the first screen is used, it's
# up to the user to enable the bottom panel or disable either one or both.
#
# Empty panels are hidden.
#
# Following items are available:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons (Can be used once)
# [*:sublets*]   Catch-all for installed sublets
# [*:sublet*]    Name of a sublet for direct placement
# [*:spacer*]    Variable spacer (free width / count of spacers)
# [*:separator*] Insert separator

#
# === Link
#
# http://subforge.org/wiki/subtle/Panel
#

screen 1 do
  stipple false # Add stipple to panels (add the ///// marks in empty spaces)


  # Content of the bottom panel
  top  [:weather,:separator,:conky, :spacer,:separator,:battery,:separator, :clock]
  
  # Content of the top panel
     bottom     [ :views,:separator, :tasks, :spacer, :separator, :cpu,:separator, :memory,:separator, :tray ]
end

############################################################################################################################################## 


# == Colors

#### Zeltak PALLETE:

#black #080808

#red #F92672

#orange #FECF35

#blue #00bbff

#grey #B8B8B8



#Title-Defines properties for the title of current client.
style :title do
  border_top    "#F92672"
end

#Focus-Defines properties for current active view.
#the ,2 is for the border thickness 

style :focus do
   padding     0, 1, 0, 1
   border_bottom   "#FECF35",2    
   foreground  "#00bbff" 
   background  "#080808" 
end

#Urgent-Defines properties for views with urgent clients.
style :urgent do
 padding     0, 0, 0, 0
 border      "#303030"
 foreground  "#FECF35"
 background  "#080808"
end

#Occupid-Defines properties for views with at least one client.

style :occupied do
 padding     0, 3, 0, 3
 border      "#303030"
 foreground  "#b8b8b8"
 background  "#080808"
end


# views: Defines properties for views in the view button list.

style :views do
 padding     0,2,0,2
 border      "#303030",0
 foreground  "#3C3C3C"
 background  "#080808"
end


#Sublets-Defines properties for sublets in the panel.

style :sublets do
 padding     0, 1, 0, 1
 border      "#080808", 1
 foreground  "#00bbff"
 background  "#080808"
end

#Separator- Defines properties for the panel separator.

style :separator do
      padding      0, 3, 0, 3
      background  "#080808"
      foreground  "#B8B8B8"
    end


#Clients- Defines properties for active and inactive clients.

style :clients do
 active      "#00bbff", 0
 inactive    "#080808", 0
 margin      0
end


#Subtle-Defines properties for subtle.

style :subtle do
 padding     0, 0, 0, 0
 panel       "#080808"
 stipple     "#757575"
end


############################################################################################################################################## 


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
# http://subforge.org/wiki/subtle/Gravity
#





# Gravities {{{
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]

gravity :top,            [   0,   0, 100,  50 ]
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
gravity :right33,        [  67,  50,  33, 100 ]

gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  67,  50,  33 ]

gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]

gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  67,  50,  33 ]

gravity :gimp_image,     [  10,   0,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [  90,   0,  10, 100 ]

gravity :dia_toolbox,    [   0,   0, 100,  15 ]
gravity :dia_window,     [   0,  15, 100,  85 ]
# }}}











  # Right
gravity :right,          [ 100,   0,  50, 100 ]
gravity :right66,        [ 100,  50,  50,  34 ]
gravity :right33,        [ 100,  50,  25,  34 ]

  # Bottom left
gravity :bottom_left,    [   0, 100,  50,  50 ]
gravity :bottom_left66,  [   0, 100,  50,  66 ]
gravity :bottom_left33,  [   0, 100,  50,  34 ]

  # Bottom
gravity :bottom,         [   0, 100, 100,  50 ]
gravity :bottom66,       [   0, 100, 100,  66 ]
gravity :bottom33,       [   0, 100, 100,  34 ]

  # Bottom right
gravity :bottom_right,   [ 100, 100,  50,  50 ]
gravity :bottom_right66, [ 100, 100,  50,  66 ]
gravity :bottom_right33, [ 100, 100,  50,  34 ]

  # Gimp
gravity :gimp_image,     [  50,  50,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [ 100,   0,  10, 100 ]

# worker
gravity :workterm1,     [  620,  630,  70, 70 ]


gravity :skype,     [  0,  0,  10, 100 ]

############################################################################################################################################## 


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
#:
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
# Chains are a combination of keys and modifiers to one key and can be used in
# various ways to trigger an action. In subtle there are two ways to define
# chains for grabs:
#
#   1. Default way*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Escape way*: Define an escape grab that needs to be pressed before
#      *any* other grab can be used like in screen/tmux.
#
#      *Example*: grab "C-y", :SubtleEscape
#                 grab "Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*] = Button1 (Left mouse button)
# [*B2*] = Button2 (Middle mouse button)
# [*B3*] = Button3 (Right mouse button)
# [*B4*] = Button4 (Mouse wheel up)
# [*B5*] = Button5 (Mouse wheel down)
#
# ==== Modifiers
#
# [*A*] = Alt key
# [*C*] = Control key
# [*M*] = Meta key
# [*S*] = Shift key
# [*W*] = Super (Windows) key
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
#
#
#
#   grab "A-Return", "urxvt"
#
# === Link
#
# http://subforge.org/wiki/subtle/Grabs
#


#GRABS



# Switch current view
grab "W-grave", :ViewSwitch1
grab "W-1", :ViewSwitch2
grab "W-2", :ViewSwitch3
grab "W-3", :ViewSwitch4
grab "W-q", :ViewSwitch5
grab "W-w", :ViewSwitch6
grab "W-e", :ViewSwitch7
grab "W-a", :ViewSwitch8
grab "W-s", :ViewSwitch9
grab "W-d", :ViewSwitch10
grab "W-z", :ViewSwitch11
grab "W-x", :ViewSwitch12
grab "W-c", :ViewSwitch13
grab "W-4", :ViewSwitch14

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-A-r", :SubtleRestart

# Power
grab "W-C-A-q", :SubtleQuit
grab "W-C-A-s", "/home/zeltak/bin/sleep.sh"

#xkill
grab "W-C-A-x", "xkill"

###Mouse
# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize



#WINDOWS 

# Toggle fullscreen mode of window
grab "W-space", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "W-t", :WindowStick

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
grab "W-S-k", :WindowKill


#launch term
grab "W-Return", "urxvt"

#launch a floating term
grab "S-W-Return" do
  @move_to_view = true
  spawn "urxvt -name remote"
  nil
end

on(:client_create){|client|
  if @move_to_view == true
    @move_to_view = false

    view   = Subtlext::View.current
    client.tags = view.tags unless client.views.include?(view)
    client.gravity = :top_right
  end
  nil
}






# Cycle between given gravities
grab "W-A-q", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-A-w", [ :top,          :top66,          :top33          ]
grab "W-A-e", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-A-a", [ :left,         :left66,         :left33         ]
grab "W-A-s", [ :center,       :center66,       :center33       ]
grab "W-A-d", [ :right,        :right66,        :right33        ]
grab "W-A-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-A-x", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-A-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]

grab "W-p Home" do |c| c.gravity = :center; end
grab "W-p End" do |c| c.gravity = :bottom; end
grab "W-p l" do |c| c.gravity = :left; end
grab "W-p r" do |c| c.gravity = :right; end
grab "W-p u" do |c| c.gravity = :top; end

# Exec programs


#mimic alt-tab in windows
grab "A-Tab" do Subtlext::Client.recent[1].focus; end



####dmenu dzen
#
#All keys are :
#1)main commnd
#2)main menu for that command (key+meta)
#3)auxilary command (key+meta+alt)
#4)second auxilary command (key+meta+alt+Ctrl)

#yengesh
#grab "A-q", "yang.sh"

#grab "A-q", "kupfer"  #uneeded launchins is done from kupfer itself
grab "A-q", "/home/zeltak/scripts/dmenu/dmenuLauncher.pl" 


#sys menus
grab "W-F1", "/home/zeltak/bin/helpmenu.sh"
grab "W-F2", "/home/zeltak/bin/commands.sh"


#mpd
grab "XF86Launch1", "mpc toggle"
grab "Pause", "mpc next"
grab "W-Pause", "/home/zeltak/bin/mpd_menu.sh"
grab "W-A-Pause", "mpd_zfav.sh"
grab "W-A-C-Pause", "mpd_control -a"
grab "S-Pause", "albumbler "


#localization
grab "W-C-A-l", "/home/zeltak/scripts/local/hebrew.sh" 
grab "W-A-l", "/home/zeltak/scripts/local/english.sh" 
#grab "W-l h", "/home/zeltak/scripts/local/hebrew.sh" 
#grab "W-l e", "/home/zeltak/scripts/local/english.sh" 




#scrot
grab "Print", "/home/zeltak/scripts/scrot/sfull_up.sh"
grab "W-Print", "/home/zeltak/bin/scrotmenu.sh"
grab "S-Print", "/home/zeltak/scripts/scrot/sselect.sh"



#volume
#grab "XF86AudioRaiseVolume", "amixer set Master 5dB+" 
#grab "XF86AudioLowerVolume", "amixer set Master 5dB-" 
grab "XF86AudioRaiseVolume", "gdvol -i 5" 
grab "XF86AudioLowerVolume", "gdvol -d 5" 




#launchers
#all launhers start with ctrl-win then key
grab "C-W-w", "tx_ssh"
grab "C-W-3", "tx_player"

#jump to specific currently runing prog
grab "W-A-y", lambda { c = Subtlext::Client["tx_player"]; if(c) then c.raise; c.focus; end }  



#########Legacy#####################
# Escape grab
#  grab "C-y", :SubtleEscape

# Jump to view1, view2, ...
#grab "W-S-grave", :ViewJump1
#grab "W-S-1", :ViewJump2
#grab "W-S-2", :ViewJump3
#grab "W-S-3", :ViewJump4
#grab "W-S-4", :ViewJump5
#grab "W-S-5", :ViewJump6

# Select next and prev view */
#grab "W-A-Right",:ViewNext
#grab "W-A-Left", :ViewPrev

# Move mouse to screen1, screen2, ...
#grab "W-A-1", :ScreenJump1
#grab "W-A-2", :ScreenJump2
#grab "W-A-3", :ScreenJump3
#grab "W-A-4", :ScreenJump4


#clipbored
#grab "W-Insert", "dmenuclip"
#grab "W-A-Insert", "anamnesis -b"


############################################################################################################################################## 

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
# [*string*]  With a WM_CLASS/WM_NAME
# [*hash*]    With a hash of properties
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
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# [*float*]   This property either sets the tagged client floating or prevents
#              it from being floating depending on the value.
#
#              Example: float true
#
# [*full*]    This property either sets the tagged client to fullscreen or
#              prevents it from being set to fullscreen depending on the value.
#
#              Example: full true
#
# [*gravity*] This property sets a certain to gravity to the tagged client,
#              but only on views that have this tag too.
#
#              Example: gravity :center
#
# [*match*]   This property adds matching patterns to a tag, a tag can have
#              more than one. Matching works either via plaintext, regex
#              (see man regex(7)) or window id. Per default tags will only
#              match the WM_NAME and the WM_CLASS portion of a client, this
#              can be changed with following possible values:
#
#              [*:name*]      Match the WM_NAME
#              [*:instance*]  Match the first (instance) part from WM_CLASS
#              [*:class*]     Match the second (class) part from WM_CLASS
#              [*:role*]      Match the window role
#
#              Example: match :instance => "urxvt"
#                       match [:role, :class] => "test"
#                       match "[xa]+term"
#
# [*exclude*] This property works exactly the same way as *match*, but it
#              excludes clients that match from this tag. That can be helpful
#              with catch-all tags e.g. for console apps.
#
#              Example: exclude :instance => "irssi"
#
# [*resize*]  This property either enables or disables honoring of client
#              resize hints and is independent of the global option.
#
#              Example: resize true
#
# [*size*]    This property sets a certain to size as well as floating to the
#              tagged client, but only on views that have this tag too. It
#              expects an array with x, y, width and height values.
#
#              Example: size [100, 100, 50, 50]
#
# [*stick*]   This property either sets the tagged client to stick or prevents
#              it from being set to stick depending on the value. Stick clients
#              are visible on every view.
#
#              Example: stick true
#
# [*type*]    This property sets the [[Tagging|tagged]] client to be treated
#              as a specific window type though as the window sets the type
#              itself. Following types are possible:
#
#              [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#              [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#              [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#              [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#              [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#
#              Example: type :desktop
#
# [*urgent*]  This property either sets the tagged client to be urgent or
#              prevents it from being urgent depending on the value. Urgent
#              clients will get keyboard and mouse focus automatically.
#
#              Example: urgent true
#
# === Link
#
# http://subforge.org/wiki/subtle/Tagging
#


#TAGS


tag "terms" do
  match :instance =>     "xterm|urxvt"
  gravity  :center
  resize   true
end
 

#Net

tag "browser" do
  match "navigator|(google\-)?chrom[e|ium]|browser|firefox|opera"
  gravity :center
  end


tag "thunder" , "thunderbird|mail|Mail"


tag "skype" do
    match :class => "skype"   
end


#office

tag "tview" do
    match :instance => "TeamViewer.exe"   
end



tag "VB" , "VirtualBox"   



#Media

tag "media" do
    match :instance => "mpd_z" 
end


tag "gmpc" do
    match :instance => "gmpc" 
end


#Term apps

tag "ssh" do 
match :instance =>  "ssh_home"
end

tag "task" do
    match  "task_z" 
end

tag "vim" do
    match :instance => "vim_z" 
end

tag "ranger" do
     match :instance => "ranger_z"
end


#office
 
tag "gvim" do
    match :instance => "gvim" 
end

tag "notecase" do
    match :instance => "<unknown>"
end




####Worker related

tag "worker" do
     match :class => "work"
     urgent true
end

tag "worker_term" do
    match :instance => "worker_term" 
    gravity :workterm1
end


tag "morph" do
     match :class => "python2"
     urgent true
end


tag "feh" do
     match :instance => "feh"
end


tag "xsvg" do
     match :instance => "xsvg"
end





###Floating

tag "kupfer" do
     match :class => "kupfer"
     float true
     urgent true
end




####Terminals


tag "topleft" do
  match :instance => "topleft"
  gravity :top_left
end

tag "topright" do
  match :instance => "topright"
  gravity :top_right
end

tag "botleft" do
  match :instance => "botleft"
  gravity :bottom_left
end

tag "botright" do
  match :instance => "botright"
  gravity :bottom_right
end




# Placement
tag "editor" do
  match  "[g]?vim"
  resize true
end

tag "fixed" do
  gravity :top_right33
  stick    true
end

tag "resize" do
  match  "sakura|gvim"
  match  "keepassx"
  resize true
end

tag "gravity" do
  gravity :center
end

# Modes
tag "stick" do
  match "mplayer|feh|gcolor2|smplayer|xsvg"
  float true
  stick true
  urgent true
end

tag "float" do
  match "display"
  match :name => "Copying*";
  match :name => "Moving*";
  match "keepassx"
  match "smplayer"
  float true
end


tag "flash" do
   match "<unkown>|exe|operapluginwrapper" 
   stick true
 end


#### Gimp
tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox$"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end


#legacy options
#tag "terms",   do; match "[u]?rxvt|konsole"; exclude "mpd_z|ranger_z|mc_z|rmc_z|worker_term|ssh_home|mail_z|vim_z|task_z|topleft|topright|botleft|botright"; end
#tag "browser", "uzbl|opera|chrome|firefox|navigator|chromium|firefox-nightly|minefield|chromium-browser"
#tag "mc" do
     #match :instance => "mc_z"
#end


#tag "rmc" do
     #match :instance => "rmc_z"
#end



############################################################################################################################################## 

# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#


#VIEWS


view "home" do
match "default" 
icon  "/home/zeltak/MLT/xbm/home.xbm" 
icon_only true
end



view "terms" do
match "terms" 
icon  "/home/zeltak/MLT/xbm/terminal.xbm" 
icon_only true
end



view "www" do
match "firefox|chrome|browser" 
icon  "/home/zeltak/MLT/xbm/world.xbm" 
icon_only true
end


view "media" do
match "media|gmpc" 
icon  "/home/zeltak/MLT/xbm/note1.xbm" 
icon_only true
end



view "ranger" do
match "ranger|mc|rmc|worker|xterm|leafpad|morph|worker_term" 
icon  "/home/zeltak/MLT/xbm/fm.xbm" 
icon_only true
end



view "ssh" do
match "ssh" 
icon  "/home/zeltak/MLT/xbm/dish.xbm" 
icon_only true
end



view "notecase" do
match "notecase" 
icon  "/home/zeltak/MLT/xbm/notecase.xbm" 
icon_only true
end



view "vim" do
match "vim|gvim" 
icon  "/home/zeltak/MLT/xbm/clip.xbm" 
icon_only true
end



view "mail" do
match "mail|thunder" 
icon  "/home/zeltak/MLT/xbm/mail.xbm" 
icon_only true
end

view "task" do
match "task" 
icon  "/home/zeltak/MLT/xbm/list.xbm" 
icon_only true
end

view "info" do
match  "topleft|topright|botleft|botright"
icon  "/home/zeltak/MLT/xbm/info.xbm" 
icon_only true
end

view "office" do
match "tview" 
icon  "/home/zeltak/MLT/xbm/flask2.xbm" 
icon_only true
end


view "VM" do
match  "tview|VB"
icon  "/home/zeltak/MLT/xbm/box_in.xbm" 
icon_only true
end


view "chat" do
match  "skype"
icon  "/home/zeltak/MLT/xbm/balloon.xbm" 
icon_only true
end


############################################################################################################################################## 


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


#SUBLETS
sublet :clock do
   interval      50
   format_string "%H:%M(%d/%m)"
   icon_fg       "#FECF35"
 end


sublet :mpd do
host "localhost"
port 6600
 end

 sublet :conky do
   interval      1
 end

sublet :weather do
interval      5000
locale             "en"
units                  "c"
location               "Boston"
direction              "right"
forecast_length       3
hide_current          "false"
current_label          "Now"
temp_suffix            "*"
sep                    "/"
 end


 sublet :battery do
   interval      50
   icon_fg       "#FECF35"

 end

 sublet :cpu do
   interval      1
   icon_fg       "#FECF35"
 end

 sublet :memory do
   interval      1
   icon_fg       "#FECF35"
 end


 ############################################################################################################################################## 

 # == Hooks
# # And finally hooks are a way to bind Ruby scripts to a certain event.  # # Following hooks exist so far: # # [*:client_create*]    Called whenever a window is created
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
#

# vim:ts=2:bs=2:sw=2:et:fdm=marker



############################################################################################################################################## 

#Extras (Contrib)

#launcher

 begin
   require "#{ENV["HOME"]}/bin/launcher.rb" 
 
   # Set fonts
   Subtle::Contrib::Launcher.fonts = [
     "xft:DejaVu Sans Mono:pixelsize=80:antialias=true",
     "xft:DejaVu Sans Mono:pixelsize=12:antialias=true" 
   ]

 # Set paths
   Subtle::Contrib::Launcher.paths = [ "/usr/bin", "~/bin" ]
 rescue LoadError => error
   puts error
 end


 grab "A-F3" do
   Subtle::Contrib::Launcher.run
 end



#selector
 begin
   require "#{ENV["HOME"]}/bin/selector.rb" 

#set font
Subtle::Contrib::Selector.font = "xft:DejaVu Sans Mono:pixelsize=22:antialias=true" 

 rescue LoadError => error
   puts error
 end
 
 grab "W-Tab" do
   Subtle::Contrib::Selector.run
 end

