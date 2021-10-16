#!/bin/bash

declare -a user_dirs=("~/.vscode-root" "~/.vscode")

for user_dir in "${user_dirs[@]}"
do
    sudo code --install-extension eamodio.gitlens --force --user-data-dir="$user_dir"

    sudo code --install-extension PKief.material-icon-theme --force --user-data-dir="$user_dir"
    sudo code --install-extension esbenp.prettier-vscode --force --user-data-dir="$user_dir"
    sudo code --install-extension michelemelluso.code-beautifier --force --user-data-dir="$user_dir"
    sudo code --install-extension streetsidesoftware.code-spell-checker --force --user-data-dir="$user_dir"
    sudo code --install-extension BriteSnow.vscode-toggle-quotes --force --user-data-dir="$user_dir"
    sudo code --install-extension andys8.jest-snippets --force --user-data-dir="$user_dir"
    sudo code --install-extension dbaeumer.vscode-eslint --force --user-data-dir="$user_dir"
    sudo code --install-extension ms-python.vscode-pylance --force --user-data-dir="$user_dir"
    sudo code --install-extension ms-python.python --force --user-data-dir="$user_dir"
    sudo code --install-extension ms-toolsai.jupyter --force --user-data-dir="$user_dir"
done

