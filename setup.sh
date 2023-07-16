dot_path=$(dirname "$(realpath "$0")")

sudo ln -sf "$dot_path"/flake.nix /etc/nixos/flake.nix
./rebuild.sh $1
