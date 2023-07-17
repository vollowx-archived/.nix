dot_path=$(dirname "$(realpath "$0")")

doas ln -sf "$dot_path"/flake.nix /etc/nixos/flake.nix
./rebuild.sh $1
