try:
    import readline
except ImportError:
    print('module readline not available')
else:
    import rlcompleter
    readline.parse_and_bind('tab: complete')

