git clone https://github.com/richardchen331/config.git /tmp/config
cd /tmp/config

if [ -f ~/.zshrc ]
then
	mv ~/.zshrc ~/.zshrc.bak
else
	echo "\033[0;34mzsh not found, installing now\033[0m"
	curl -L http://install.ohmyz.sh | sh
fi
cp zshrc ~/.zshrc
source ~/.zshrc

if [ -f ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.bak
fi
cp vimrc ~/.vimrc
