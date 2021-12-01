#!/bin/bash

declare -a extensions=(
        "eamodio.gitlens"
        "PKief.material-icon-theme"
        "esbenp.prettier-vscode"
        "michelemelluso.code-beautifier"
        "streetsidesoftware.code-spell-checker"
        "BriteSnow.vscode-toggle-quotes"
        "andys8.jest-snippets"
        "dbaeumer.vscode-eslint"
        "ms-python.vscode-pylance"
        "ms-python.python"
        "ms-toolsai.jupyter"
    )

for extension in "${extensions[@]}"
do
    sudo code --install-extension "$extension" --force --user-data-dir="~/.vscode-root"
    code --install-extension "$extension" --force
done

