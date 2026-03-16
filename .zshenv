export QT_QPA_PLATFORMTHEME=qt5ct
export LIBVA_DRIVER_NAME=amdgpu

export BUN_INSTALL="$HOME/pkgs/bun"
export GOROOT="$HOME/pkgs/go"
export GOPATH="$HOME/go"

export ANDROID_HOME="$HOME/Android/Sdk"

export CONTAINERS_STORAGE_CONF="$HOME/.config/containers/storage.conf"

path+=(
	$HOME/pkgs/bin
	$HOME/pkgs/node/bin
	$HOME/pkgs/npm/bin
	$HOME/pkgs/idea/bin
	$HOME/pkgs/go/bin
	$GOPATH/bin
	$ANDROID_HOME/platform-tools
)
