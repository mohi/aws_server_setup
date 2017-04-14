cd ~/aws_server_setup
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp files/dotfiles/.zshrc ~
cp files/dotfiles/magrawal_robbyrussell.zsh-theme ~/.oh-my-zsh/themes/

if [ $? -eq 0 ];
then
    echo "Done copying the theme"
else
    echo "Didn't complete"
fi
