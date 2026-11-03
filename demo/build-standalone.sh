#!/usr/bin/env sh
# Wraps tacit-demo.html (the published artifact source) into a standalone page
# that opens directly in a browser: demo/index.html.
set -e
dir=$(cd "$(dirname "$0")" && pwd)
{
  printf '%s\n' '<!doctype html>' '<html lang="en">' '<head>' '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    '<style>[hidden]{display:none!important}body{margin:0}img{max-width:100%}</style>' '</head>' '<body>'
  cat "$dir/tacit-demo.html"
  printf '%s\n' '</body>' '</html>'
} > "$dir/index.html"
echo "Wrote $dir/index.html"
