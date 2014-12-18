#!javascript
//<userscripts___SCRIPT
extensions.load("userscripts", {
//<userscripts___CONFIG
  // paths to userscripts, this extension will also load all scripts in from
  // $XDG_CONFIG_HOME/.config/dwb/scripts
  scripts : []
//>userscripts___CONFIG

});
//>userscripts___SCRIPT
//<contenthandler___SCRIPT
extensions.load("contenthandler", {
//<contenthandler___CONFIG
  // %u will be replaced with the uri of the request

  // Handle requests based on filename extension
  extension : {
    // "torrent" : "xterm -e 'aria2 %u'",
    // "pdf" : "xterm -e 'wget %u --directory-prefix=~/mypdfs'"
  },

  // Handle requests based on URI scheme
  uriScheme : {
    // "ftp" : "xterm -e 'ncftp %u'"
  },

  // Handle requests based on MIME type
  mimeType : {
    // "application/pdf" : "xterm -e 'wget %u --directory-prefix=~/mypdfs'"
  }
//>contenthandler___CONFIG

});
//>contenthandler___SCRIPT
//<adblock_subscriptions___SCRIPT
extensions.load("adblock_subscriptions", {
//<adblock_subscriptions___CONFIG
  // To take effect dwb needs to be restarted

  // Shortcut to subscribe to a filterlist
  scSubscribe : null,
  // Command to subscribe to a filterlist
  cmdSubscribe : "adblock_subscribe",

  // Shortcut to unsubscribe from a filterlist
  scUnsubscribe : null,

  // Command to unsubscribe from a filterlist
  cmdUnsubscribe : "adblock_unsubscribe",

  // Path to the filterlist directory, will be created if it doesn't exist.
  filterListDir : data.configDir + "/adblock_lists"
//>adblock_subscriptions___CONFIG
});
//>adblock_subscriptions___SCRIPT
//<multimarks___SCRIPT
extensions.load("multimarks", {
//<multimarks___CONFIG
// Adds current url to a multimark, if the mark doesn't exist a new one will be
// created
addMark : ",a",
cmdAddMark : "mm_add",

// Add current url to a multimark, show a list of all exsiting
// multimarks, if the mark doesn't exist a new one will be
// created
addListedMark : ",A",

// Open a multimark
openMark : "gm",
cmdOpenMark : "mm_open",

// Open a multimark, show a list of all existing multimarks
openListedMark : "gM",

// If set to true multimarks shortest matching multimarks will be opened
// automatically, if set to false Return must be pressed
autoOpen : false,

// Delete a multimark
deleteMark : ",d",
cmdDeleteMark : "mm_delete",

// Delete a multimark, show a list of all existing multimarks
deleteListedMark : ",D",

// Delete an url from a multimark, if it was the last url the multimark is
// deleted
deleteFromMark : ",f",
cmdDeleteFromMark : "mm_remove",

// Delete an url from a multimark, if it was the last url the multimark is
// deleted
deleteFromListedMark : ",F",

// Shows all urls for a mark
showMark : ",s",
cmdShowMark : "mm_show",

// Shows all urls for a mark, show a list of all existing marks
showListedMark : ",S"

//>multimarks___CONFIG

});
//>multimarks___SCRIPT
//<downloadhandler___SCRIPT
extensions.load("downloadhandler", {
//<downloadhandler___CONFIG
   handler : [
     // Each handler must have 2 or 3 properties:
     //
     // command : command to execute, must contain %f which will be replaced with
     //           the filepath, this property is mandatory
     //
     // extension : a filename extension, optional
     //
     // mimeType  : a mimetype, optional
     //

     // { command : "xpdf %f", mimeType : "application/pdf" }
     // { command : "xdvi %f", extension : "dvi" }
     { command : "mv %f /home/zeltak/Downloads/pdf", mimeType : "application/pdf" }
   ]
//>downloadhandler___CONFIG

});
//>downloadhandler___SCRIPT
//<formfiller___SCRIPT
extensions.load("formfiller", {
//<formfiller___CONFIG
// shortcut that gets and saves formdata
scGetForm : "efg",

// shortcut that fills a form
scFillForm : "eff",

// path to the formdata file
formData : data.configDir + "/forms",

// whether to use a gpg-encrypted file
useGPG : false,

// additional arguments passed to gpg2 when encrypting the formdata
GPGOptEncrypt : "",

// additional arguments passed to gpg2 when decrypting the formdata
GPGOptDecrypt : "",

// whether to save the password in memory when gpg is used
keepPassword : true,

// whether to save the whole formdata in memory when gpg is used
keepFormdata : false

//>formfiller___CONFIG

});
//>formfiller___SCRIPT
//<simplyread___SCRIPT
extensions.load("simplyread", {
//<simplyread___CONFIG
// Shortcut to toggle simplyread
shortcut : "SR",

// Command to toggle simplyread
command : "simplyread",

// Whether to use a stylesheet
nostyle : false,

// Whether to show links
nolinks : false

//>simplyread___CONFIG

});
//>simplyread___SCRIPT
//<perdomainsettings___SCRIPT
extensions.load("perdomainsettings", {
//<perdomainsettings___CONFIG
  // Settings applied based on the second level domain, e.g.
  // domains : { "example.com" : { autoLoadImages : true } },
  domains : {},

  //Settings applied based on the hostname
  // hosts : { "www.example.com" : { autoLoadImages : true } },
  hosts : {},

  // Settings applied based on the uri
  // uris : { "http://www.example.com/foo/" : { autoLoadImages : true } },
uris : {
     "http://color.hailpixel.com" :  {
          "autoLoadImages" : false,
          "enableScripts"  : false
     }
  },
  // Default settings, for each setting in domains, hosts and uris a
  // default-value should be specified, e.g.
  // defaults : { autoLoadImages : false },
  defaults : {}

//>perdomainsettings___CONFIG
});
//>perdomainsettings___SCRIPT
