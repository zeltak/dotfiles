#
# This program can be distributed under the terms of the GNU GPL.
# See the file COPYING.
#
# $Id: .config/subtle/subtle.rb,v 381 2011/08/31 22:11:04 unexist $
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
set :separator, "∞"
# }}}

# Screens {{{
screen 1 do
  stipple false
  top     [:title, :spacer, :views, :center, :clock, :fuzzytime, :separator, :cpu,:separator,  :wifi, :separator, :jdownloader, :center]
  bottom  [:conky, :spacer,:separator,:battery,:separator, :clock]
  view    1
end


# }}}

# Styles {{{
style :all do
  padding    2, 6, 2, 6
  background "#1a1a1a"
end

style :title do
  foreground "#FFFFFF"
end

style :views do
  style :focus do
    foreground    "#ffffff"
    border_bottom "#acaa53", 2
  end

  style :occupied do
    foreground    "#7c7c72"
    border_bottom "#949269", 2
  end

  style :unoccupied do
    foreground "#7c7c72"
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
end # }}}

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

gravity :bottom_right,   [  50,  50,  50,  50 ], :vert
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

# Contrib
grab "W-A-x" do
  Subtle::Contrib::Launcher.run
end

grab "W-A-z" do
  Subtle::Contrib::Selector.run
end

# Scratchpad
grab "W-A-y" do
  if((c = Subtlext::Client["scratch"]))
    c.toggle_stick
    c.focus
  elsif((c = Subtlext::Subtle.spawn("urxvt -name scratch")))
    c.tags  = []
    c.flags = [ :stick ]
  end
end




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

#mimic alt-tab in windows
grab "A-Tab" do Subtlext::Client.recent[1].focus; end

####dmenu dzen
#
#All keys are :
#1)main commnd
#2)main menu for that command (key+meta)
#3)auxilary command (key+meta+alt)
#4)second auxilary command (key+meta+alt+Ctrl)

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
grab "C-W-w", "ssh_home"
grab "C-W-3", "mpdz"

#jump to specific currently runing prog
grab "W-A-I", lambda { c = Subtlext::Client["tx_player"]; if(c) then c.raise; c.focus; end }  






# }}}

# Tags {{{
tag "terms" do
  match    instance: "xterm|urxvt"
  gravity  :center
  resize   true
end

tag "test" do
  match instance: "test", class: "urxvt"
  geometry [ 943, 548, 640, 480 ]
end

tag "browser" do
  match "navigator|(google\-)?chrom[e|ium]"

  if("proteus" == host or "pc03112" == host)
    gravity :top75
  else
    gravity :center
  end
end

tag "pdf" do
  match "apvlv|evince"
  stick true
end

tag "editor" do
  match  "[g]?vim|eclipse"
  resize true

  if("mockra" == host or "proteus" == host or "pc03112" == host)
    gravity :top75
  else
    gravity :center
  end
end

tag "xeph640" do
  match    "xeph640"
  geometry [ 943, 548, 640, 480 ]
end

tag "xeph800" do
  match    "xeph800"
  geometry [ 855, 172, 800, 800 ]
end


tag "android" do
  match "SDL_App"
end

tag "mplayer" do
  match   "mplayer"
  float   true
  stick   true
  #urgent  true
  position [ 2650, 50 ]
end

tag "stick" do
  match  "dialog|subtly|python|gtk.rb|display|pychrom|skype|xev"
  stick  true
  float  true
end

tag "urgent" do
  match  "sun-awt-X11-XDialogPeer"
  type   :dialog
  stick  true
  urgent true
  float  true
end

tag "void" do
  match "jd-Main|Virtualbox"
end

tag "powerfolder" do
  match "de-dal33t-powerfolder-PowerFolder"
  float true
  stick true
end

tag "pms" do
  match "net-pms-PMS"
  resize true
end

tag "dialogs" do
  match type: [ :dialog, :splash ]
  stick true
end

tag "flash" do
  match "exe|<unknown>"
  stick true
end

tag "one" do
  match    "urxvt2"
  gravity  :bottom_left
end

tag "one25" do
  match    "urxvt2"
  gravity  :bottom_left25
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

tag "gimp_image" do
  match    role: "gimp-image-window"
  gravity  :gimp_image
end

tag "gimp_toolbox" do
  match    role: "gimp-toolbox$"
  gravity  :gimp_toolbox
end

tag "gimp_dock" do
  match    role: "gimp-dock"
  gravity  :gimp_dock
end

tag "gimp_scum" do
  match role: "gimp-.*|screenshot"
end

tag "dia_window" do
  match   role: "diagram_window"
  gravity :dia_window
end

tag "dia_toolbox" do
  match   role: "toolbox_window"
  gravity :dia_toolbox
end

tag "inkscape" do
  match "inkscape"
end

tag "xfontsel" do
  match    "xfontsel"
  geometry [464, 433, 676, 113]
  stick    true
end

tag "xev" do
  match    name: "Event[ ]Tester"
  geometry [1213, 98, 377, 321]
  float    true
  stick    true
end
# }}}

# Views {{{

iconpath = "#{ENV["HOME"]}/MLT/xbm/"



view "home" do
match "default" 
icon  "#{iconpath}/home.xbm" 
icon_only true
end



view "terms" do
match "terms" 
icon  "#{iconpath}/terminal.xbm" 
icon_only true
end



view "www" do
match "firefox|chrome|browser" 
icon  "#{iconpath}/world.xbm" 
icon_only true
end



view "media" do
match "media|gmpc" 
icon  "#{iconpath}/note1.xbm" 
icon_only true
end



view "ranger" do
match "ranger|mc|rmc|worker|xterm|leafpad|morph|worker_term" 
icon  "#{iconpath}/fm.xbm" 
icon_only true
end



view "ssh" do
match "ssh" 
icon  "#{iconpath}/dish.xbm" 
icon_only true
end



view "notecase" do
match "notecase" 
icon  "#{iconpath}/notecase.xbm" 
icon_only true
end



view "vim" do
match "vim|gvim" 
icon  "#{iconpath}/clip.xbm" 
icon_only true
end



view "mail" do
match "mail|thunder" 
icon  "#{iconpath}/mail.xbm" 
icon_only true
end

view "task" do
match "task" 
icon  "#{iconpath}/list.xbm" 
icon_only true
end

view "info" do
match  "topleft|topright|botleft|botright"
icon  "#{iconpath}/info.xbm" 
icon_only true
end

view "office" do
match "tview" 
icon  "#{iconpath}/flask2.xbm" 
icon_only true
end


view "VM" do
match  "tview|VB"
icon  "#{iconpath}/box_in.xbm" 
icon_only true
end


view "chat" do
match  "skype"
icon  "#{iconpath}/balloon.xbm" 
icon_only true
end


on :view_jump do |v|
  views = Hash[*Subtlext::Screen.all.map { |s|
    [ s.view.name.to_sym, space[space.keys[s.id]] ] }.flatten
  ]

  Subtlext::View.all.each do |va|
    sym = va.name.to_sym

    if(views.keys.include?(sym))
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

# Commands {{{
def xbmc
  Subtlext::Screen[0].view = :terms
  Subtlext::Screen[1].view = :browser

  Subtlext::Subtle.spawn("xinit xbmc -- :#{rand(10)}")
end # }}}
