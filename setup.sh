#!/usr/bin/env bash

# Expects to be run in root of the git repository. Also, for Vim/Neovim
# compatibility, this expects ~/.vim to work for a configuration directory with
# a vimrc file.

# Arguments:
#     $1 original file, expects file to be relative to current directory.
#         Do not include ./ in name. This will work but then the symlink will
#         include the ./.
#     $2 new file to link
# Does nothing when $2 exists and is $1. Defaults to hardlinks for files and
# symlinks for directories.
function symlink-with-warning {
if [[ ! -e "$1" ]]; then
    echo "${1} does not exist to link to."
    return 1
elif [[ -e "$2"  &&  ! "$2" -ef "$1" ]]; then
    echo "${2} exists and is not ${1}. Cannot safely symlink"
    return 1
elif [[ ! -e "$2" ]]; then
    filename="$(pwd)/${1}"
    if [[ -d "$1" ]]; then
        ln -s "$filename" "$2"
    else
        ln "$filename" "$2"
    fi
fi
}

symlink-with-warning vim "${HOME}/.vim" || echo "Vim config installation failed." && exit 1

plugin_error_msg="Could not properly install plugins via VimPlug."
if [ command -v nvim ]; then
    nvim -s setup.vim || echo "$plugin_error_msg" && exit 1
else
    vim -s setup.vim || echo "$plugin_error_msg" && exit 1
fi
