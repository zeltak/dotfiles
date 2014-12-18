menu=$(gpaste oneline-history | rofi -dmenu -p "clipboard")
selection=$(echo "$menu" | cut -d ':' -f1)
gpaste select $selection
