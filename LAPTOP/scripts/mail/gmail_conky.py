#!/usr/bin/env python
import urllib.request
import re

URL = "https://mail.google.com/gmail/feed/atom"

username = "ikloog@gmail.com"
password = "XXXXXX"

def find(term, lines):
    for line in lines:
        if re.search(term, line):
            return line

    print("?")
    exit(1)

def get_feed():
    auth_handler = urllib.request.HTTPBasicAuthHandler()
    auth_handler.add_password(realm = "New mail feed", uri = "https://mail.google.com/", user = username, passwd = password)
    opener = urllib.request.build_opener(auth_handler)

    urllib.request.install_opener(opener)

    try:
        feed = urllib.request.urlopen(URL).read()
    except urllib.error.URLError:
        print("?")
        exit(1)

    return feed

xml = get_feed()
xml = xml.decode()
linebyline = xml.splitlines()

count = find("<fullcount>", linebyline)
count = re.sub("^.*(\d+).*$", r"\1", count)
print(count)
