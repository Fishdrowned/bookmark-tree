jQuery ($) ->
  $('[data-i18n-key]').each (idx, elem) ->
    elem = $(elem)
    key = elem.attr('data-i18n-key')
    method = elem.attr('data-i18n-method') || 'text'
    translated = chrome.i18n.getMessage(key)
    elem[method](translated || "translation missing: #{key}")

  behaviors = JSON.parse(localStorage.behaviors || '{}')
  shortcuts = JSON.parse(localStorage.shortcuts || '{}')
  window.options =
    width: parseInt(localStorage.width) || 300
    height: parseInt(localStorage.height) || 400
    rootDirectory: localStorage.rootDirectory || '0'
    rememberOpenedDirectory: localStorage.rememberOpenedDirectory == 'true'
    behaviors:
      bookmark:
        left:   behaviors.bookmark?.left   || 'openInNewTab'
        middle: behaviors.bookmark?.middle || 'openInCurrentTab'
        right:  behaviors.bookmark?.right  || 'openInBackgroundTab'
      directory:
        left:   behaviors.directory?.left   || 'toggle'
        middle: behaviors.directory?.middle || 'openAllInCurrentWindow'
        right:  behaviors.directory?.right  || 'openAllInNewWindow'
    customStyle: localStorage.customStyle || ''
    shortcuts:
      disable: shortcuts.disable
      openBookmarkTreeInNewTab:
        modifier: shortcuts.openBookmarkTreeInNewTab?.modifier || 'alt'
        key: shortcuts.openBookmarkTreeInNewTab?.key || 'b'
      openBookmarkTreeInNewWindow:
        modifier: shortcuts.openBookmarkTreeInNewWindow?.modifier || 'alt'
        key: shortcuts.openBookmarkTreeInNewWindow?.key || 'w'

  window.delay = (callback) -> setTimeout(callback, 10)
