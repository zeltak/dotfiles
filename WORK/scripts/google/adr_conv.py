#!/usr/bin/python
# adr_conv.py
#
# Converts a vCard address book into abook addressbook format
#
# Author:   Gavin Costello
# Date:     19.02.2009
name = '';
phone = '';
email = '';
count = 1;

cfile = open('contacts.vcf', 'r')
for line in cfile.readlines():
    if (line.startswith('FN')):
        count += 1
        name = line.split(':')[1]
        print
        print u'[%d]' % count
        print u'name=%s' % unicode(name, "utf-8"),
    if (line.startswith('EMAIL')):
        email = line.split(':')[1]
        print u'email=%s' % email,
    if (line.startswith('TEL')):
        tel = line.split(';')[1]
        fulltype = tel.split('=')[1]
        type = fulltype.split(':')[0]
        #print u'type=%s' % type,
        phone = line.split(':')[1]
        if (type.endswith('CELL')):
            print u'mobile=%s' % phone,
        elif (type.endswith('HOME')):
            print u'phone=%s' % phone,
        elif (type.endswith('WORK')):
            print u'work=%s' % phone,
