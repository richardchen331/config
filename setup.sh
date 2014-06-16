if [ -f ~/.bashrc ]:
then
	mv ~/.bashrc ~/.bashrc.bak
fi
cp bashrc ~/.bashrc
source ~/.bashrc

if [ -f ~/.zshrc ]:
then
	mv ~/.zshrc ~/.zshrc.bak
fi
cp zshrc ~/.zshrc
source ~/.zshrc

if [ -f ~/.vimrc ]:
then
	mv ~/.vimrc ~/.vimrc.bak
fi
cp vimrc ~/.vimrc
