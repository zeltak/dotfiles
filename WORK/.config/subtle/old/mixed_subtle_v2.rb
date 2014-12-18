#
# This program can be distributed under the terms of the GNU GPL.
# See the file COPYING.
#
# $Id: .config/subtle/subtle.rb,v 378 2011/08/26 13:38:38 unexist $
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
set :step,      5
set :snap,      10
set :gravity,   :center
set :urgent,    false
set :resize,    false
set :tiling,    false
set :font,      "xft:Envy Code R:pixelsize=13"
set :separator, "·"
# }}}

# Screens {{{
screen 1 do
  stipple false
  top     [:title, :spacer, :views, :center, :clock, :fuzzytime, :cpu, :wifi, :jdownloader, :separator, :center]
  bottom  []
  view    1
end

screen 2 do
  stipple false
  top     [:views, :spacer, :title, :tray, :center, :mpd, :sublets, :separator, :volume, :center]
  bottom  []
  view    0
end
# }}}

# Styles {{{
style :all do
  background  "#1a1a1a"
  border      0
  padding     2, 8
end

style :title do
  foreground  "#ffffff"
end

style :sublets do
  foreground "#a8a8a8"
  icon       "#777777"
end

style :separator do
  padding        1, 0, 2, 0
  foreground     "#DF8787"
end

style :clients do
  active      "#a8a8a8", 2
  inactive    "#404040", 2
  margin      3
end

style :subtle do
  padding     0
  panel       "#1a1a1a"
  background  "#595959"
  stipple     "#595959"
end

style :views do
  padding 1, 8, 0, 8

  style :focus do
    foreground     "#ffffff"
    border_bottom  "#595959", 3
  end

  style :occupied do
    foreground     "#a8a8a8"
    border_bottom  "#404040", 3
  end

  style :unoccupied do
    padding       1, 8, 2, 8
    foreground    "#777777"
    margin_bottom 1
  end

  style :urgent do
    padding        1, 8, 0, 8
    foreground     "#a8a8a8"
    border_bottom  "#DF8787", 3
  end
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
gravity :right33,        [  67,  50,  33, 100 ]

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
gravity :dia_window,     [  15,   0,  85, 100 ]
# }}}

# Grabs {{{



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



# Sublets {{{
sublet :clock do
  format_string "%a %b %d,"
end
# }}}

# Commands {{{
def xbmc
  Subtlext::Screen[0].view = :terms
  Subtlext::Screen[1].view = :browser

  Subtlext::Subtle.spawn("xinit xbmc -- :#{rand(10)}")
end # }}}
