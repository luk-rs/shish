#!/bin/sh -e

source_from_remote() {
  $file="$1"

}

if_not_installed() {
  executable="$1"
  fallback="$2"

  if [ "$(is_installed "$executable")" ]; then
    echo 'instalado'
  else
    echo $fallback
    echo "
\$\$
  $(eval "$fallback")
\$\$
"
  fi
}

is_installed() {
  executable="$1"
  command -v "$executable" >/dev/null 2>&1
}
