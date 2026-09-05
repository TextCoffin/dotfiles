#!/bin/sh
#1v for fastfetch & btop
#still under development

cd
git clone https://github.com/TextCoffin/dotfiles.git

m_a_t() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Error: Missing arguments."
        echo "Usage: move_and_timestamp <source_folder> <target_directory>"
    else
        local src="${1%/}"
        local dest="${2%/}"

        if [ ! -d "$src" ]; then
            echo "Error: Source folder '$src' does not exist."
        else
            local folder_name=$(basename "$src")
            local new_name="${folder_name}_$(date +%d.%m.%y_%Hhour)"

            # Try to create the directory and check if it succeeded
            if mkdir -p "$dest" 2>/dev/null; then
                # Try to move the folder and check the exit status of 'mv'
                if mv "$src" "$dest/$new_name" 2>/dev/null; then
                    echo "Success: Moved to $dest/$new_name"
                else
                    echo "Error: Failed to move '$src' to '$dest/$new_name'."
                fi
            else
                echo "Error: Cannot create directory '$dest'. Permission denied."
            fi
        fi
    fi
}


read -p "Save (Y/n)" answer
case "$answer" in
	[yY]* | "" )
mkdir savecfg
echo "if cannot create - already have"
	if [ -d ~/.config/fastfetch ]; then
	echo "have"
		m_a_t "$HOME/.config/fastfetch" "savecfg"
	
	else
	echo "skip..."
	fi
#########
	if [ -d ~/.config/btop ]; then
	echo "have"
		m_a_t "$HOME/.config/btop" "savecfg"
	
	else
	echo "skip..."
	fi
	if [ -d ~/.config/fish ]; then
	echo "have"
		m_a_t "$HOME/.config/fish" "savecfg"

	else
	echo "skip..."
	fi
	;;
########
	[nY]* )
	
		rm -rf ~/.config/fastfetch
		rm -rf ~/.config/btop
		rm -rf ~/.config/fish

	echo "ok"
	;;
	* )
esac

mv dotfiles/fastfetch ~/.config/
mv dotfiles/btop ~/.config/
mv dotfiles/fish ~/.config/

rm -rf ~/dotfiles/
echo "rm -rf ~/dotfiles/"

echo "eng of script"


