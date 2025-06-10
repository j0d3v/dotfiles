set -e fish_user_paths
set fish_greeting
set TERM "xterm-256color"
starship init fish | source

set -x QT_QPA_PLATFORMTHEME qt5ct
set -x LIBVA_DRIVER_NAME i965
set -x XDG_CURRENT_DESKTOP LG3D
set -x GOROOT $HOME/pkgs/go
set -x GOPATH $HOME/go

set -x PATH $PATH \
    $GOPATH/bin \
    $HOME/.cabal/bin \
    $HOME/.local/bin \
    $HOME/pkgs/bin \
    $HOME/.ghcup/bin/ \
    $HOME/pkgs/npm/bin \
    $HOME/pkgs/bun/ \
    $HOME/pkgs/go/bin \

alias sudo="doas"
