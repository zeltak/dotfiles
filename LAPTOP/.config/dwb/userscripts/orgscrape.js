//!javascript

var injectClone = function()
{
    var type = arguments[0];
    var root;
    var image_count = 0;
    var imageMapping = null;

    if (type == "selection")
    {
        var fragment = window.getSelection().getRangeAt(0).cloneContents();
        if (fragment)
        {
            root = document.createElement("span");
            root.appendChild(fragment);
        }
    }
    else
    {
        doc = document.implementation.createDocument(document.namespaceURI, null, null);
        root = doc.importNode(document.documentElement, true);
    }
    if (!root)
    {
        return null;
    }

    Array.prototype.forEach.call(root.querySelectorAll("img"), function(img) {
        imageMapping = imageMapping || {};
        var image = "image_" + image_count++;
        if (/^\/\//.test(img.src))
            imageMapping["http:" + img.src] = image;
        else if (/https?:\/\//.test(img.src))
        {
            imageMapping[img.src] = image;
        }
        else
        {
            imageMapping[location.protocol + "//" + location.hostname + img.src] = image;
        }
        img.setAttribute("src",  image);
    });

    return {
        html : root.innerHTML,
        images : imageMapping
    };
};

function spawn(directory, selection)
{
    var tmpfile = "/tmp/" + script.generateId() + ".html";
    var output = directory + "/tmp.org";
    io.write(tmpfile, "w", selection);
    system.spawn("sh -c 'pandoc -s -S " + tmpfile + " -o " + output + "; emacs " + output + "'");
    system.spawn("rm " + tmpfile);
}

function clone(type)
{
    var selection = JSON.parse(tabs.current.focusedFrame.inject(injectClone, type));
    if (!selection)
        return;

    var directory = "/tmp/emacs_org_" + tabs.current.mainFrame.domain;
    system.mkdir(directory, 0700);

    var pending = 0;
    if (selection.images)
    {
        for (var link in selection.images) {
            var d = new WebKitDownload(link);
            d.destinationUri = "file:///" + directory + "/" + selection.images[link];
            pending++;
            d.start(function(download) {
                switch (download.status)
                {
                case DownloadStatus.finished:
                case DownloadStatus.error:
                case DownloadStatus.cancelled:
                    pending--;
                    break;
                    default : return;
                }
                if (pending == 0)
                {
                    spawn(directory, selection.html);
                }
            });
        }
    }
    else
    {
        spawn(directory, selection.html);
    }
}
bind("xps", clone.bind(null, "selection").debug(script), "clone_selection");
bind("xpf", clone.bind(null, "full").debug(script), "clone_full");
