#check out this repo to ~/devenv (type git clone in ~) or rename later for this to succeed
cd ~/devenv

mkdir ~/.vim
mkdir ~/.vim/plugged
mkdir ~/.config/nvim
ln -sfn ./vim/plugged ~/.config/nvim/

#delete if these already exist
#(careful with -Rf if symlinks already exist, otherwise the originals get killed)
#rm ~/.vim/after
#rm ~/.vim/autoload
#rm ~/.config/nvim/after
#rm ~/.config/nvim/autoload
ln -sf ~/devenv/vim/after ~/.vim/
ln -sf ~/devenv/vim/autoload ~/.vim/
ln -sf ~/devenv/vim/after ~/.config/nvim/
ln -sf ~/devenv/vim/autoload ~/.config/nvim/

#map folder from here to local folders
ln -sf ~/devenv/.vimrc ~/.vimrc
ln -sf ~/devenv/.vimrc ~/.config/nvim/init.vim
ln -sf ~/devenv/.gvimrc ~/.gvimrc
ln -sf ~/devenv/.tmux.conf ~/.tmux.conf
ln -sf ~/devenv/.gitconfig ~/.gitconfig
ln -sf ~/devenv/.ctags ~/.ctags
ln -sf ~/devenv/zsh-history-substring-search.zsh ~/zsh-history-substring-search.zsh

#install zprezto before this
ln -sf ~/devenv/runcoms/zprofile ~/.zprezto/runcoms/zprofile
ln -sf ~/devenv/runcoms/zlogin ~/.zprezto/runcoms/zlogin
ln -sf ~/devenv/runcoms/zlogout ~/.zprezto/runcoms/zlogout
ln -sf ~/devenv/runcoms/zpreztorc ~/.zprezto/runcoms/zpreztorc
ln -sf ~/devenv/runcoms/zshenv ~/.zprezto/runcoms/zshenv
ln -sf ~/devenv/runcoms/zshrc ~/.zprezto/runcoms/zshrc

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

