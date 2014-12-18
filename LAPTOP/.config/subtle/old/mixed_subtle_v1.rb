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
#screen 1 do
  #stipple false
  #top     [:title, :spacer, :views, :center, :clock, :fuzzytime, :cpu, :wifi, :jdownloader, :separator, :center]
  #bottom  []
  #view    1
#end

#screen 2 do
  #stipple false
  #top     [:views, :spacer, :title, :tray, :center, :mpd, :sublets, :separator, :volume, :center]
  #bottom  []
  #view    0
#end

screen 1 do
  stipple false # Add stipple to panels (add the ///// marks in empty spaces)


  # Content of the bottom panel
  top  [:weather,:separator,:conky, :spacer,:separator,:battery,:separator, :clock]
  
  # Content of the top panel
     bottom     [ :views,:separator, :tasks, :spacer, :separator, :cpu,:separator, :memory,:separator, :tray ]
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
# Host specific
host     = Socket.gethostname
modkey   = "W"
gravkeys = [ "KP_7", "KP_8", "KP_9", "KP_4", "KP_5", "KP_6", "KP_1", "KP_2", "KP_3" ]

if("telas" == host || "mockra" == host) #< Netbooks
  gravkeys = [ "q", "w", "e", "a", "s", "d", "y", "x", "c" ]
elsif("test" == host) #< Usually VMs
  modkey = "A"
end

# Views and screens
#(1..6).each do |i|
  #grab modkey + "-#{i}",   "ViewSwitch#{i}".to_sym
  #grab modkey + "-S-#{i}", "ViewJump#{i}".to_sym
  #grab modkey + "-F#{i}",  "ScreenJump#{i}".to_sym
#end

# Windows
grab modkey + "-B1",      :WindowMove
grab modkey + "-B3",      :WindowResize
grab modkey + "-S-f",     :WindowFloat
grab modkey + "-S-space", :WindowFull
grab modkey + "-S-s",     :WindowStick
grab modkey + "-S-equal", :WindowZaphod
grab modkey + "-r",       :WindowRaise
grab modkey + "-l",       :WindowLower
grab modkey + "-Left",    :WindowLeft
grab modkey + "-Down",    :WindowDown
grab modkey + "-Up",      :WindowUp
grab modkey + "-Right",   :WindowRight
#grab modkey + "-k",       :WindowKill
grab modkey + "-h", lambda { |c| c.retag }

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
  grab "%s-%s" % [ modkey, gravkeys[i] ], gravities[i]

  grab "%s-C-%s" % [ modkey, gravkeys[i] ], lambda {
    c = Subtlext::Client.visible.select { |c|
      gravities[i].include?(c.gravity.name.to_sym)
    }

    c.first.focus unless(c.empty?)
  }
end

# Multimedia keys
#grab "XF86AudioMute",        :VolumeToggle
#grab "XF86AudioRaiseVolume", :VolumeRaise
#grab "XF86AudioLowerVolume", :VolumeLower
#grab "XF86AudioPlay",        :MpdToggle
#grab "XF86AudioStop",        :MpdStop
#grab "XF86AudioNext",        :MpdNext
#grab "XF86AudioPrev",        :MpdPrevious

grab modkey + "-m", "mpc current | tr -d '\n' | xclip"

# Programs
grab modkey + "-Return", "urxvt"
#grab modkey + "-g", "gvim"
#grab modkey + "-f", "firefox -no-remote -ProfileManager"

# Contrib
grab "W-x" do
  Subtle::Contrib::Launcher.run
end

grab "W-z" do
  Subtle::Contrib::Selector.run
end

# Scratchpad
grab "W-y" do
  if((c = Subtlext::Client["scratch"]))
    c.toggle_stick
    c.focus
  elsif((c = Subtlext::Subtle.spawn("urxvt -name scratch")))
    c.tags  = []
    c.flags = [ :stick ]
  end
end

# Pychrom
grab modkey + "-p" do
  if((t = Subtlext::Tray[:pychrom]))
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

##############################################################
###Zadd


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

# Power
grab "W-C-A-q", :SubtleQuit
grab "W-C-A-s", "/home/zeltak/bin/sleep.sh"
#xkill
grab "W-C-A-x", "xkill"

# Lower window
grab "W-l", :WindowLower

#launch a floating term
grab "S-W-Return" do
  @move_to_view = true
  spawn "urxvt -name remote"
  nil
end

#mimic alt-tab in windows
grab "A-Tab" do Subtlext::Client.recent[1].focus; end


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



#scrot
grab "Print", "/home/zeltak/scripts/scrot/sfull_up.sh"
grab "W-Print", "/home/zeltak/bin/scrotmenu.sh"
grab "S-Print", "/home/zeltak/scripts/scrot/sselect.sh"

#volume
grab "XF86AudioRaiseVolume", "gdvol -i 5" 
grab "XF86AudioLowerVolume", "gdvol -d 5" 



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

#tag "browser" do
  #match "navigator|(google\-)?chrom[e|ium]"

  #if("proteus" == host or "pc03112" == host)
    #gravity :top75
  #else
    #gravity :center
  #end
#end

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

##############################################################
###Zadd

tag "browser" do
  match "navigator|(google\-)?chrom[e|ium]|browser|firefox|opera"
  gravity :center
  end


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

# }}}





# Views {{{
if("mockra" == host or "proteus" == host or "pc03112" == host)
  www_re    = "browser|one25|three25"
  test_re   = "xeph[0-9]+|android|three25"
  editor_re = "editor|one25|three25"
  icons     = true
else
  www_re    = "browser"
  test_re   = "android|xeph[0-9]+|eight|one$|test"
  editor_re = "editor"
  icons     = true
end

iconpath = "#{ENV["HOME"]}/MLT/xbm/"

#view "terms" do
  #match     "terms|eight|two"
 ## icon      "#{iconpath}/terminal.xbm"
  #icon_only icons
#end

#view "www" do
  #match     www_re
 ## icon      "#{iconpath}/world.xbm"
  #icon_only icons
#end

#view "void" do
  #match     "default|void|powerfolder|pms"
  ##icon      "#{iconpath}/quote.xbm"
  #icon_only icons
#end

#view "sketch" do
  #match     "inkscape|dia_*|gimp_.*"
  ##icon      "#{iconpath}/paint.xbm"
  #icon_only icons
#end

#view "test" do
  #match     test_re
  ##icon      "#{iconpath}/bug.xbm"
  #icon_only icons
#end

#view "editor" do
  #match     editor_re
  ##icon      "#{iconpath}/ruby.xbm"
  #icon_only icons
#end

##############################################################
###Zadd



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







# }^}}

## Sublets {{{




#sublet :clock do
  #format_string "%a %b %d,"
#end
## }}}

# Commands {{{
#def xbmc
  #Subtlext::Screen[0].view = :terms
  #Subtlext::Screen[1].view = :browser

  #Subtlext::Subtle.spawn("xinit xbmc -- :#{rand(10)}")
#end # }}}



##############################################################
###Zadd



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

