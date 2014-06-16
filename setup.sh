if [ -f ~/.zshrc ]
then
	mv ~/.zshrc ~/.zshrc.bak
else
	echo 'zsh not found, installing now'
	curl -L http://install.ohmyz.sh | sh
fi
cp zshrc ~/.zshrc
source ~/.zshrc

if [ -f ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.bak
fi
cp vimrc ~/.vimrc
