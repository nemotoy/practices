#!/usr/bin/env bash

set -euo pipefail

parse_json(){
    local current_path; current_path="$(cd "$(dirname "$0")"; pwd)"
    file="${current_path}/sample.json"
    # JSONファイルから'[]'を削除し、キー'name'に該当する文字列を出力する。valuesは半角スペース区切りで出力する。
    local ss; ss=$(< "${file}" jq -r '.[] | .name + " " + (.values | join(" "))')
    # 空行をセットする
    IFS=$'\n'
    for line in ${ss}; do
        # 配列rawに文字列lineを半角スペース区切りでセットする。
        IFS=' ' read -a raw <<< "${line}"
        name="${raw[0]}"
        values=("${raw[@]:1}")
        echo name: "${name}", values: "${values[@]}"
    done
    # IFSのリセットする
    unset IFS
}

parse_json
