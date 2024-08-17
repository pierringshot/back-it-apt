#!/bin/bash

# Update and upgrade packages
apt update -y && apt upgrade -y

# Install necessary packages
apt install -y zsh git toilet lolcat ncurses-utils

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Neofetch
apt install -y neofetch

# Install Ruby and required gems
apt install -y ruby
gem install lolcat

# Install Zsh plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
fi

# Create .zshrc if it doesn't exist
if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
fi

# Add configuration to .zshrc
cat <<EOL >> "$HOME/.zshrc"

# Set Zsh theme and configuration
ZSH_THEME="ys" # set by \`omz\`
export ZSH=\$HOME/.oh-my-zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo history-substring-search zsh-completions)
source \$ZSH/oh-my-zsh.sh

# Custom aliases
alias chcolor='/data/data/com.termux/files/home/.termux/colors.sh'
alias chfont='/data/data/com.termux/files/home/.termux/fonts.sh'
alias tools="cd /data/data/com.termux/files/home/tools && clear && ls && echo -e \"\nTools\n\""
alias macrodroid="cd /storage/emulated/0/MacroDroid/ && clear && ls && echo -e \"\nMacroDroid\n\""
alias droidbase="cd /storage/emulated/0/Android/data/com.luckydroid.droidbase/files/files/ && clear && tree && echo -e \"\nDroidBase\n\""
alias droidbasf="cd /storage/emulated/0/Android/data/com.luckydroid.droidbasf/files/files/ && clear && tree && echo -e \"\nDroidBasf\n\""
alias apdate="apt-get clean && apt update && apt full-upgrade && apt autoremove && clean && echo -e \"\nApdate\n\""
alias storage="clear && cd /storage/emulated/0/ && clear && ls"
alias tasker="cd ~/.termux/tasker && clear && ls && echo -e \"\nTERMUX TASKER DIRECTORY\n\" && tree"

# Function to count files in directories
lsc() {
    ls -l | grep '^d' | awk '{print $9}' | while read dir; do
        echo -n "$dir: "
        find "$dir" -type f | wc -l
    done
}

# Function to create animated ASCII art
create_ascii_animation() {
    local text="PierringShot Electronics™"
    local width=\$(tput cols)
    local height=\$(tput lines)
    local center_col=\$(( (width - \${#text}) / 2 ))
    local center_row=\$(( height / 2 ))

    echo -e "\033c"  # Clear the screen
    for ((i=1; i<=5; i++)); do
        tput cup \$((center_row - i)) \$center_col
        toilet -f term -F border "$text" | lolcat
        sleep 0.05
    done
}

# Display NeoFetch and animated ASCII art on terminal startup
neofetch --ascii_distro Arch --ascii_colors 6 6 6 --color_blocks off --disable title underline --ascii_lines off --lines off --blocks off --fast --speed fast --loop 1 --color off
create_ascii_animation
EOL

# Change default shell to zsh
chsh -s $(which zsh)

# Source the updated .zshrc
source "$HOME/.zshrc"

echo "Setup complete! Please restart your terminal or run 'source ~/.zshrc' to apply the changes."
