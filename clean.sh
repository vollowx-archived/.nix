doas nix-collect-garbage -d
echo ""
echo "Generations left:"
doas nix-env -p /nix/var/nix/profiles/system --list-generations
