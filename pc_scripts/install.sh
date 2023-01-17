#!/usr/bin/env bash

. 3rdparty/term.sh

yml_str="
'a/b':
    prefix-url: \"https://codeberg.org\"
    as: b

'c/d':
    prefix-url: \"https://gitlab.org\"
    as: d
"

for p in $(yq -r ". | to_entries | .[].key" <<< "$yml_str"); do
    echo "Package name: \"$(yq -r ".\"$p\".as" <<< "$yml_str")\"
Prefix URL: \"$(yq -r ".\"$p\".\"prefix-url\"" <<< "$yml_str")\"
"
done 
