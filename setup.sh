#check out this repo to ~/devenv (type git clone in ~) or rename later fot this to succeed
cd ~/devenv

mkdir ~/.vim
mkdir ~/.vim/plugged
mkdir ~/.config/nvim
ln -sfn ./vim/plugged ~/.config/nvim/

#delete if these allready exist
#(carefull with -Rm if symlinks allready exist, otherwise the orgiginalss get killed)
#rm ~/.vim/after
#rm ~/.vim/autoload
#rm ~/.config/nvim/after
#rm ~/.config/nvim/autoload
ln -s ~/devenv/vim/after ~/.vim/
ln -s ~/devenv/vim/autoload ~/.vim/
ln -s ~/devenv/vim/after ~/.config/nvim/
ln -s ~/devenv/vim/autoload ~/.config/nvim/

#map folder from here to local folders
ln -s ~/devenv/.vimrc ~/.vimrc
ln -s ~/devenv/.gvimrc ~/.gvimrc
ln -s ~/devenv/.tmux.conf ~/.tmux.conf
ln -s ~/devenv/.gitconfig ~/.gitconfig
ln -s ~/devenv/.ctags ~/.ctags
ln -s ~/devenv/zsh-history-substring-search.zsh ~/zsh-history-substring-search.zsh

#install zprezto before this
ln -s ~/devenv/runcoms/zprofile ~/.zprezto/runcoms/zprofile
ln -s ~/devenv/runcoms/zlogin ~/.zprezto/runcoms/zlogin
ln -s ~/devenv/runcoms/zlogout ~/.zprezto/runcoms/zlogout
ln -s ~/devenv/runcoms/zpreztorc ~/.zprezto/runcoms/zpreztorc
ln -s ~/devenv/runcoms/zshenv ~/.zprezto/runcoms/zshenv
ln -s ~/devenv/runcoms/zshrc ~/.zprezto/runcoms/zshrc

#map allready crated folders
#cp ~/.vimrc ~/devenv/.vimrc
#cp ~/.gvimrc ~/devenv/.gvimrc
#cp ~/.tmux.conf ~/devenv/.tmux.conf
#cp ~/.gitconfig ~/devenv/.gitconfig
#cp ~/.ctags ~/devenv/.ctags
#cp ~/zsh-history-substring-search.zsh ~/devenv/zsh-history-substring-search.zsh
#cp -R ~/.vim/after ~/devenv/.vim/after
#cp -R ~/.vim/autoload ~/devenv/.vim/autoload
#cp -R ~/.zprezto/runcom ~/devenv/runcom

