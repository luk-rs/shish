#!/bin/sh -e

source_from_remote() {
  file="$1"
  url="$2"

  temp_dir='/tmp'
  remote_file="$temp_dir/remote_$file.sh"

  curl -f "$remote_file" "$url"
  source "$remote_file"
  rm -rf "$remote_file"

}

source_from_remote 'index.sh' 'https://raw.githubusercontent.com/luk-rs/shish/main/index.sh'
