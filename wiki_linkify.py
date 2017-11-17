# How to use
# >>> from wiki_linkify import wiki_linkify
# >>> wiki_linkify('I <3 DigitalCrafts!')
# 'I <3 <a href="/DigitalCrafts">DigitalCrafts</a>!'

import re

def _replace(word):
    return '<a href="/%s">%s</a>' % (word.group(0), word.group(0))

def wiki_linkify(string):
    return re.sub('([A-Z][a-z]+){2,}', _replace, string)

if __name__ == '__main__':
    print wiki_linkify('API for parseJSON.')
