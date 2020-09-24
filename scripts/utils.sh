#!/bin/bash

function createYesNoPrompt {
    local question="${1} [Y/n]"
    while true; do
        read -p "$question" answer
        case "$answer" in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}
