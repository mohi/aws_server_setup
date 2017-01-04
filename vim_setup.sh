cp files/dotfiles/.vimrc ~/.vimrc
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
cp -r files/{ftplugin,mysnippet,vim-snippets} ~/.vim/
