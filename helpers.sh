#!/bin/bash

asdf_load_plugins() {
    jq -r 'keys[]' "$HOME/.tool-plugins" | while read -r entry; do
        echo $entry
        asdf plugin add "$entry"
    done
}
