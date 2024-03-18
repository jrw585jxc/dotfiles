if [[ "$(id -u)" -eq 0 ]]; then
        echo "Script is running as root"
        # check if apt is package manager
        # if apt is package manager and you run which apt it will specify a path to where>
        echo $(which apt)
        if [[ -n "$(which apt)" ]]; then
                echo "apt is installed exactly as specified."
                apt install -y \
                        nmap \
                        dnsutils \
                        libgl1-mesa-glx \
                        libegl1-mesa \
                        libxrandr2 \
                        libxrandr2 \
                        libxss1 \
                        libxcursor1 \
                        libxcomposite1 \
                        libasound2 \
                        libxi6 \
                        libxtst6
        curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
        bash Anaconda3-2024.02-1-Linux-x86_64.sh

        else
                echo "apt is not installed at the specified location."
        fi


git config --global user.name "jrw585jxc"
git config --global user.email "jrw585jxc@proton.me"
git config --global core.editor "vim"
git config --global core.excludesfile ~/.gitignore_global
git config --global help.autocorrect 1
cp ~/.gitconfig ~/dotfiles/.gitconfig

cat <<EOT >> ~/.bashrc
alias ll='ls -alF'
alias gs='git status'
EOT
cp ~/.bashrc ~/dotfiles/.bashrc

# Check if ~/.ssh folder exists, if not create it
mkdir -p ~/.ssh

# Copy authorized_keys to the repository and symlink it
cp ~/.ssh/authorized_keys ~/dotfiles/authorized_keys
ln -sf ~/dotfiles/authorized_keys ~/.ssh/authorized_keys

# Create ssh config and symlink it
cat <<EOT > ~/.ssh/config
Host fry.cs.wright.edu
    Hostname fry.cs.wright.edu
    User your_username_here
EOT
ln -sf ~/dotfiles/config ~/.ssh/config

# Install Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/colors
wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -O ~/.vim/colors/gruvbox.vim

# Install a vim improvement plugin
vim +PluginInstall +qall


else
        echo "Script is not running as root, exiting..." 1>&2
        exit 1
fi

