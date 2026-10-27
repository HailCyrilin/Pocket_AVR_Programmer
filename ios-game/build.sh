#!/bin/sh
# Wraps game.html in a full standalone page (iOS home-screen meta tags) as index.html.
cd "$(dirname "$0")"
{
  printf '%s\n' '<!doctype html>' '<html lang="en">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, viewport-fit=cover">' \
    '<meta name="apple-mobile-web-app-capable" content="yes">' \
    '<meta name="mobile-web-app-capable" content="yes">' \
    '<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">' \
    '<meta name="apple-mobile-web-app-title" content="Horde Hwy">' \
    '<meta name="theme-color" content="#16141a">' \
    '<style>:root{padding:env(safe-area-inset-top,0px) 0 env(safe-area-inset-bottom,0px)}body{margin:0}</style>' \
    '</head>' '<body>'
  cat game.html
  printf '%s\n' '</body>' '</html>'
} > index.html
