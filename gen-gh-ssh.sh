ssh-keygen -t ed25519 -C "$1"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo ""
echo "Copy this and paste to your GitHub SSH settings"
cat ~/.ssh/id_ed25519.pub
