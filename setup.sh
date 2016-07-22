#check out this repo to ~/devenv (type git clone in ~)

cd ~/devenv

mkdir ~/.vim
mkdir ~/.vim/plugged
mkdir ~/.config/nvim
ln -sfn ./vim/plugged ~/.config/nvim/

#delete if these allready exist
ln -s ~/devenv/vim/after ~/.vim/
ln -s ~/devenv/vim/autoload ~/.vim/
ln -s ~/devenv/vim/after ~/.config/nvim/
ln -s ~/devenv/vim/autoload ~/.config/nvim/

#map folder from here to local folders
ln ~/devenv/.vimrc ~/.vimrc
ln ~/devenv/.gvimrc ~/.gvimrc
ln ~/devenv/.tmux.conf ~/.tmux.conf
ln ~/devenv/.gitconfig ~/.gitconfig
ln ~/devenv/.ctags ~/.ctags
ln ~/devenv/zsh-history-substring-search.zshm ~/zsh-history-substring-search.zshm

#install zprezto before this
ln ~/devenv/runcoms/zprofile ~/.zprezto/runcoms/zprofile
ln ~/devenv/runcoms/zlogin ~/.zprezto/runcoms/zlogin
ln ~/devenv/runcoms/zlogout ~/.zprezto/runcoms/zlogout
ln ~/devenv/runcoms/zpreztorc ~/.zprezto/runcoms/zpreztorc
ln ~/devenv/runcoms/zshenv ~/.zprezto/runcoms/zshenv
ln ~/devenv/runcoms/zshrc ~/.zprezto/runcoms/zshrc

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

