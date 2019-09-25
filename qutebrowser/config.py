import themes.dracula.draw

themes.dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    },
    'font': {
        'family': 'SauceCodePro Nerd Font, Monospace',
        'size': 10
    }
})

searchengines = {
        'google': 'https://www.google.com/search?hl=en&q={}',
        'duckduckgo': 'https://duckduckgo.com/?q={}',
        'archwiki': 'https://wiki.archlinux.org/?search={}'
        }


def set_default_searchengine(key):
    if key in searchengines:
        searchengines['DEFAULT'] = searchengines[key]
        del searchengines[key]
    c.url.searchengines = searchengines

set_default_searchengine('google')

c.url.start_pages = [
        'https://www.google.com'
        ]
