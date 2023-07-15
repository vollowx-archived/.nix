sudo nix-collect-garbage -d
echo ""
echo "Generations left:"
sudo nix-env -p /nix/var/nix/profiles/system --list-generations
