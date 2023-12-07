#!/bin/sh -e

# source_from_remote() {
#   file="$1"
#   url='https://github.com/luk-rs/shish/blob/main/index.sh'

#   temp_dir='/tmp'
#   local_file="$temp_dir/install$file.sh"

#   curl -o "$local_file" "$url"
#   source_from_remote "$local_file"
#   rm -rf "$local_file"

# }

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

# source_from_remote 'luis'
echo 'hello from the cloud'
