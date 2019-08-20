#!/usr/bin/env bash

set -euo pipefail

parse_json(){
    local current_path; current_path="$(cd "$(dirname "$0")"; pwd)"
    file="${current_path}/sample.json"
    echo "${file}"
}

parse_json
