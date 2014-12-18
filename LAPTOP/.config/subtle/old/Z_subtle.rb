# -*- encoding: utf-8 -*-

# This program can be distributed under the terms of the GNU GPL.
# See the file COPYING.
#
# $Id: .config/subtle/subtle.rb,v 426 2012/05/23 00:03:48 unexist $
#

require "socket"

# Contrib {{{
begin
  require "/home/zeltak/.local/share/subtle/contrib/launcher.rb"
  require "/home/zeltak/.local/share/subtle/contrib/selector.rb"

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
set :resize,    false
# }}}

# Screens {{{
screen 1 do
  top     [:views,:separator,:tasks, :spacer,:separator,:center, :mpd,:center,:separator,:battery,:memory,:cpu, :separator,  :tray,  :separator, :clock]
  bottom  []
end

# }}}

# Styles {{{
style :all do
  padding    2, 6, 2, 6
  background "#000000"
  # font       "xft:Envy Code R:pixelsize=13"
  font       "xft:roboto:pixelsize=11"
end

style :title do
  foreground "#FFFFFF"
end

style :views do
  foreground "#000000"
  icon       "#FFFFFF"

  style :focus do
    foreground    "#33B5E5"
    icon          "#33B5E5"
    border_bottom "#33B5E5", 3
  end

  style :occupied do
    foreground    "#C5EAF8"
    border_bottom "#000000", 1
  end

  style :urgent do
    foreground "#FF4444"
    icon       "#FF4444"
  end

  style :visible do
    padding_top 0
    border_top  "#000000", 2
  end
end

style :sublets do
  foreground "#33B5E5"
  icon       "#33B5E5"
end

style :separator do
  foreground "#33B5E5"
  separator  "|"
end

style :clients do
  active   "#33B5E5", 4 #must match inactivce one
  inactive "#494948", 4
  margin   2 #the space between each client (window)
end

style :subtle do
  panel      "#000000"
  background "#595959"
  stipple    "#000000"
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

gravity :mpdup,            [   0,   0, 100,  55 ]
gravity :mpdbot,     [   0, 55, 100, 45], :horz


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










# }}}

# Grabs {{{
# Host specific
host     = Socket.gethostname
modkey   = "W"
gravkeys = [ "KP_7", "KP_8", "KP_9", "KP_4", "KP_5", "KP_6", "KP_1", "KP_2", "KP_3" ]

# grab modkey + "-S-h", lambda { |c| c.retag }



# Switch current view
grab "W-grave", :ViewSwitch1
grab "W-1", :ViewSwitch2
grab "W-2", :ViewSwitch3
grab "W-3", :ViewSwitch4
grab "W-4", :ViewSwitch5
grab "W-q", :ViewSwitch6
grab "W-w", :ViewSwitch7
grab "W-e", :ViewSwitch8
grab "W-a", :ViewSwitch9
grab "W-s", :ViewSwitch10
grab "W-d", :ViewSwitch11
grab "W-z", :ViewSwitch12
grab "W-x", :ViewSwitch13




# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-A-r", :SubtleRestart

# Power
grab "W-C-A-q", :SubtleQuit
#grab "W-C-A-s", "/home/zeltak/bin/sleep.sh"


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




# grab "W-p Home" do |c| c.gravity = :center; end
# grab "W-p End" do |c| c.gravity = :bottom; end
# grab "W-p l" do |c| c.gravity = :left; end
# grab "W-p r" do |c| c.gravity = :right; end
# grab "W-p u" do |c| c.gravity = :top; end

# Exec programs


#mimic alt-tab in windows
#grab "A-Tab" do Subtlext::Client.recent[1].focus; end
 grab "A-Tab" do
   clients = Subtlext::Client.visible
 
   clients.last.instance_eval do
     focus
     raise
   end
 end
 
 grab "A-S-Tab" do 
 clients = Subtlext::Client.visible
 
   clients.first.instance_eval do                                                 
     lower                                                                        
   end
   clients.first.instance_eval do
     focus
   end                                                                            
 end




#localization
grab "W-C-A-l", "/home/zeltak/scripts/local/hebrew.sh" 
grab "W-A-l", "/home/zeltak/scripts/local/english.sh" 
#grab "W-l h", "/home/zeltak/scripts/local/hebrew.sh" 
#grab "W-l e", "/home/zeltak/scripts/local/english.sh" 




#volume
#grab "XF86AudioRaiseVolume", "amixer set Master 5dB+" 
#grab "XF86AudioLowerVolume", "amixer set Master 5dB-" 
#grab "XF86AudioRaiseVolume", "gdvol -i 5" 
#grab "XF86AudioLowerVolume", "gdvol -d 5" 




#jump to specific currently runing prog
#grab "W-A-y", lambda { c = Subtlext::Client["tx_player"]; if(c) then c.raise; c.focus; end }  





# Contrib
grab "W-j" do
  Subtle::Contrib::Launcher.run
end

grab "W-k" do
  Subtle::Contrib::Selector.run
end

# Scratchpad
grab "W-A-y" do
  if (c = Subtlext::Client.first("scratch"))
    c.toggle_stick
    c.focus
  elsif (c = Subtlext::Subtle.spawn("urxvt -name scratch"))
    c.tags  = []
    c.flags = [ :stick ]
  end
end


# }}}





# Tags {{{

tag "terms" do
  match    instance: "xterm|urxvt"
  gravity  :center
  resize   false
end

tag "browser" do
  match "uzbl|opera|firefox|navigator|chromium|Browser|Minefield|Navigator|<unknown>|gnome-mplayer|Exe|jumanji|dwb|<unknown>|plugin-container|exe|operapluginwrapper|npviewer.bin"
end

tag "borderless" do
   match       "uzbl|opera|firefox|navigator|chromium|Browser|Minefield|Navigator|<unknown>|gnome-mplayer|Exe|jumanji|dwb|<unknown>|plugin-container|exe|operapluginwrapper|npviewer.bin" 
   borderless  true
 end


#simple matches

tag "vol" do
  match "pavucontrol"
end

tag "skype" do
  match "skype"
   gravity :right
   resize true
end

tag "spacefm" do
     match  "spacefm"
end

tag "notecase" do
     match  "Notecase"
end


tag "kupfer" do
     match :class => "kupfer"
     float true
     urgent true
end

tag "gfx" do
  match "gthumb|Gthumb|Shotwell|shotwell|digikam|Digikam|gimp|inkscape"
end

tag "wine" do
  match "Wine"
  gravity :center
  float true
end

tag "editor" do
  match  "[g]?vim|eclipse"
  resize true
end


tag "mplayer" do
  match   "mplayer"
  float   true
  stick   1
end

tag "stick" do
  match  "dialog|subtly|python|gtk.rb|display|pychrom|xev|evince|exe|<unknown>|plugin-container"
  stick  true
  float  true
end

tag "urgent" do
  stick  true
  urgent true
  float  true
end




#Media
#
tag "mpd1" do
  match  "mpd1"
  gravity :mpdup
resize   false
end

tag "mpd2" do
  match  "mpd2"
  gravity :mpdbot
resize   false
end

tag "mpd3" do
  match  "mpd3"
  gravity :mpdbot
resize   false
end

tag "mpd4" do
  match  "mpd4"
  gravity :mpdbot
resize   false
end



tag "gmpc" do
    match :instance => "gmpc" 
end


tag "gcolor" do
    match :instance => "gcolor2" 
  stick  true
  float  true
end


#Term apps

tag "ssh" do 
match :instance =>  "ssh_home"
end

tag "task" do
    match  "utilz" 
end





# }}}

# Views {{{


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
match "media|gmpc|mpd|mpd1|mpd2|mpd3|mpd4" 
icon  "/home/zeltak/MLT/xbm/note1.xbm" 
icon_only true
end

view "chat" do
match  "skype"
icon  "/home/zeltak/MLT/xbm/balloon.xbm" 
icon_only true
end


view "FM" do
match "ranger|mc|rmc|worker|xterm|leafpad|morph|worker_term|spacefm" 
icon  "/home/zeltak/MLT/xbm/fm.xbm" 
icon_only true
end



view "ssh" do
match "ssh" 
icon  "/home/zeltak/MLT/xbm/dish.xbm" 
icon_only true
end



view "NC" do
match "notecase" 
icon  "/home/zeltak/MLT/xbm/notecase.xbm" 
icon_only true
end



view "vim" do
match "vim|gvim|editor" 
icon  "/home/zeltak/MLT/xbm/clip.xbm" 
icon_only true
end

view "info" do
match  "topleft|topright|botleft|botright"
icon  "/home/zeltak/MLT/xbm/info.xbm" 
icon_only true
end


view "vol" do
match "vol" 
icon  "/home/zeltak/MLT/xbm/list.xbm" 
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





# }}}

# Sublets {{{
 sublet :clock do
   interval      50
   style         :foobar
   foreground "#33B5E5"
   format_string "%H:%M(%d/%m)" 
 end

sublet :mpd do
   show_icons false
   show_colors true
   foreground "#33B5E5"
   background "#000000"
   pause_text  "<mpd paused>"
   artist_color  "#33B5E5"
   title_color   "#33B5E5"
   not_running_text "<mpd stopped>"
   album_color "#586e75"
   stop_color "#586e75"
   pause_color "#586e75"
   note_color   "#33B5E5"
end




sublet :battery do
  colors 10 => "#FF0000", 20 => "#33B5E5", 100 => "#33B5E5"
end 

sublet :memory do
  interval 10
end

sublet :cpu do
  interval 10
end

# }}}

#starup
 on :start do
   Subtlext::Subtle.spawn "kupfer" 
 end
 
 

#|nm-applet|xbindkeys|chromium|xchainkeys|gvim|skype|spacefm|notecase|pavucontrol
