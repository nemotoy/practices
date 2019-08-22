#!/usr/bin/env bash

set -euo pipefail

parse_args(){
  while getopts a:b:c: opt
  do
    case "$opt" in
      a) A="true" ;;
      b) B="true" ;;
      c) C="true" ;;
      *) echo "Invalid argument: $opt"
    esac
  done
  echo "A:${A:-} B:${B:-} C:${C:-}"
}

# ./shells/parse_args/parse.sh -a "aaa" -b "bbb" -c "ccc"
parse_args "$@"
